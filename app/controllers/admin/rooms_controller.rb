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
    end

    def new
      @room = Room.new
    end

    def edit; end

    def create
      @room = Room.new(room_params)
      redirect_to admin_rooms_url(@room), notice: 'Room was successfully created.' if @room.save
    end

    def update
      if @room.update(room_params)
        flash[:success] = 'Room was updated.'
        redirect_to admin_room_url(@room)
      end
    end

    def destroy
      @room.destroy
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
