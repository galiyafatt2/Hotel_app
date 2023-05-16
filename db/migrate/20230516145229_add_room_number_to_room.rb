class AddRoomNumberToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column(:rooms, :room_number, :integer)
  end
end
