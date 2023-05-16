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
        redirect_to admin_reviews_path, notice: 'Отзыв был опубликован'
      end
    end

    def destroy
      @review.destroy
      redirect_to admin_reviews_path, notice: 'Отзыв был удален'
    end

    private

    def set_review
      @review = Review.find(params[:id])
    end
  end
end
