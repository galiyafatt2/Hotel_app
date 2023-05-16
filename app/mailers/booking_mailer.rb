class BookingMailer < ApplicationMailer

  def booking_approved
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Ваша бронь была одобрена')
  end
end
