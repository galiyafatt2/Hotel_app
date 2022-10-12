# frozen_string_literal: true

class ExportBookingsCsvJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    attributes = %w[id name email move_in move_out room_id]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      Booking.all.where(accepted: true).order(created_at: :desc).each do |booking|
        csv << [booking.id, booking.name, booking.email, booking.move_in, booking.move_out,
                booking.room_id]
      end
    end
  end
end
