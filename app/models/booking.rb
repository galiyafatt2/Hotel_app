# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :room
  validates :move_in, :move_out, presence: true

  def self.to_xlsx
    ExportBookingsXlsxJob.new.perform(all)
  end

  def self.to_csv
    ExportBookingsCsvJob.new.perform(all)
  end
end
