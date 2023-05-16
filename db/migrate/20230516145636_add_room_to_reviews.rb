class AddRoomToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :room
  end
end
