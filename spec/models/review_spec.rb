require 'rails_helper'

RSpec.describe Review, type: :model do
  review = Review.new name: "name", email: "email", review_text: "review"
  context 'after creating' do
    it 'published must be false' do
      expect(review.published).to eq(false)
    end
  end
end
