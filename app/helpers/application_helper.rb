# frozen_string_literal: true

module ApplicationHelper
  def image_tag(source, options={})
    source = 'assets/images/blank.jpg' if source.blank?
    super(source, options) if source.present?
  end
end
