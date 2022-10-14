# frozen_string_literal: true

module Admin
  class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only: %i[show update destroy]
    def index
      @reviews = Review.all.order(created_at: :desc)
    end

    def show; end

    def update
      if @review.update(published: true)
        flash[:success] = 'Review was published'
        redirect_to admin_reviews_path
      end
    end

    def destroy
      @review.destroy
      flash[:success] = 'Review was deleted'
      redirect_to admin_reviews_path
    end

    private

    def set_review
      @review = Review.find(params[:id])
    end
  end
end
