# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.date :move_in, null: false
      t.date :move_out, null: false
      t.boolean :accepted, default: false, null: false
      t.timestamps
    end
  end
end
