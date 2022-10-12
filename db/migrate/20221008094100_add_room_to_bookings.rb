# frozen_string_literal: true

class AddRoomToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :room
  end
end
