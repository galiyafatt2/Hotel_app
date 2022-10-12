# frozen_string_literal: true

module Admin
  class PagesController < ApplicationController
    before_action :authenticate_user!
    def index
      @rooms = Room.all.with_attached_images
    end
  end
end
