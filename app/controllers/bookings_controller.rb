# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all.order(created_at: :desc)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(booking_params)
    redirect_to booking_url(@booking) if @booking.save
  end

  def destroy
    redirect_to rooms_url if @booking.destroy
  end

  def update
    redirect_to booking_url(@booking) if @booking.update(booking_params)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :move_in, :move_out, :room_id)
  end
end
