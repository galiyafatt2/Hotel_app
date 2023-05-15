# frozen_string_literal: true

module Admin
  class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_room, only: %i[show edit update destroy]
    def index
      @rooms = Room.all.with_attached_images.order(created_at: :desc)
    end

    def show
      @room_photos = @room.images.all
      @bookings = @room.active_bookings.where(accepted: true)
    end

    def new
      @room = Room.new
    end

    def edit; end

    def create
      @room = Room.new(room_params)
      redirect_to admin_rooms_path, notice: 'Комната была создана.' if @room.save
    end

    def update
      if @room.update(room_params)
        flash[:notice] = 'Room was updated.'
        redirect_to admin_rooms_path, notice: 'Комната была обновлена'
      else
        render :edit, status: :bad_request
      end
    end

    def destroy
      Booking.where(room_id: @room.id).each do |booking|
        Booking.destroy(booking.id)
      end
      if @room.destroy
        redirect_to admin_rooms_path
      end
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_name, :short_description, :long_description, :price, images: [])
    end
  end
end
