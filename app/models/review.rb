# frozen_string_literal: true

class Review < ApplicationRecord
  validates :name, :email, :review_text, presence: true
  before_save { self.email = email.downcase }
end
