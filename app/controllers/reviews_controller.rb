# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.where(published: true).order(created_at: :desc)
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'Review was successfully created'
      redirect_to reviews_path
    else
      @reviews = Review.all.where(published: true).order(created_at: :desc)
      render 'reviews/index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :review_text)
  end
end
