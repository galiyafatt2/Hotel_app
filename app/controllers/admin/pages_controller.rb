# frozen_string_literal: true

module Admin
  class PagesController < ApplicationController
    before_action :authenticate_user!
    def index
      begin
        @rooms = Room.all.with_attached_images
        rescue Redis::CannotConnectError
        rescue ActionView::Template::Error
          p "no images here"
      end
    end
  end
end
