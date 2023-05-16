# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'guest_house@example.com'
  layout 'mailer'
end
