# frozen_string_literal: true

module ApplicationHelper
  def image_tag(source, options = {})
    super(source, options) if source.present?
  end
end
