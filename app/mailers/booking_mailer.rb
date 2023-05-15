class BookingMailer < ApplicationMailer

  def booking_approved
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Your booking was approved')
  end
end
