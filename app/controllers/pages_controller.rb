# frozen_string_literal: true

class PagesController < ApplicationController
  include HTTParty
  def index
    redirect_to '/admin' if user_signed_in?
    @rooms = Room.all.with_attached_images
    weather
  end

  private

  def weather
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/group?appid=6726452b30524451234e6dc452d78184&id=498817&units=metric')
    body = JSON.parse(response.body)
    @temp = body['list'][0]['main']['temp']
    @clouds = body['list'][0]['weather'][0]['description']
    @wind = body['list'][0]['wind']['speed']
  end
end
