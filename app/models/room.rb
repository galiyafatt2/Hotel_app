# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :bookings
  has_many_attached :images

  def images_as_thumbnails(image)
    return unless image.content_type.in?(%w[image/jpg image/jpeg image/png])

    image.variant(resize_to_limit: [400, 200]).processed
  end
end
