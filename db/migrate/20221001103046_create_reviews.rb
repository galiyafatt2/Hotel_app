# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :review_text, null: false
      t.boolean :published, default: false, null: false
      t.timestamps
    end
  end
end
