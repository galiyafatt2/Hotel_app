# frozen_string_literal: true

module Admin
  class PagesController < ApplicationController
    before_action :authenticate_user!
    def index
      begin
        @rooms = Room.all.with_attached_images
      rescue Redis::CannotConnectError
        redirect_to root_path
      end
    end
  end
end
