# frozen_string_literal: true

class ExportBookingsXlsxJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    workbook = RubyXL::Workbook.new
    worksheet = workbook.add_worksheet('bookings')
    worksheet.add_cell(0, 0, 'Id')
    worksheet.add_cell(0, 1, 'Name')
    worksheet.add_cell(0, 2, 'Email')
    worksheet.add_cell(0, 3, 'Move_in')
    worksheet.add_cell(0, 4, 'Move_out')
    worksheet.add_cell(0, 5, 'Room_id')
    counter = 1
    Booking.all.where(accepted: true).each do |booking|
      worksheet.add_cell(counter, 0, booking.id)
      worksheet.add_cell(counter, 1, booking.name)
      worksheet.add_cell(counter, 2, booking.email)
      worksheet.add_cell(counter, 3, booking.move_in)
      worksheet.add_cell(counter, 4, booking.move_out)
      worksheet.add_cell(counter, 5, booking.room_id)
      counter += 1
    end
    workbook.write('bookings.xlsx')
  end
end
