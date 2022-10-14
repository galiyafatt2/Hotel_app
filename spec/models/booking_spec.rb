require 'rails_helper'

RSpec.describe Booking, type: :model do
  Room.new room_name: "room", short_description: "desc", long_description: "ldesc", price: 12, id: 24
  booking = Booking.new name: "name", email: "email", move_in: "11.10.2018", move_out: "12.10.2018", room_id: 24
  context 'after creating' do
    it 'published must be false' do
      expect(booking.accepted).to eq(false)
    end
  end
end
