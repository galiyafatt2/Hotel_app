# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :room
  validates :move_in, :move_out, presence: true
end
