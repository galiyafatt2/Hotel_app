# frozen_string_literal: true

module Admin
  class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_booking, only: %i[show edit update destroy]

    def index
      @bookings = Booking.all.order(created_at: :desc)
      respond_to do |format|
        format.html
        format.csv do
          Booking.to_csv
          render template: 'admin/bookings/index'
        end
        format.xlsx { Booking.to_xlsx }
      end
    end

    def show
      @room = @booking.room
    end

    def update
      if @booking.update(accepted: true)
        flash[:success] = 'Booking was updated'
        redirect_to admin_bookings_path
      end
    end

    def destroy
      @booking.destroy
    end

    def export
      respond_to do |format|
        format.csv do
          send_data Booking.all.where(accepted: true).to_csv.perform_async(*args),
                    filename: “bookings.csv”
        end
      end
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
