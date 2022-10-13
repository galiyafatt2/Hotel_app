# frozen_string_literal: true

module ApplicationHelper
  def image_tag(source, options={})
    source = 'assets/images/blank.jpg' unless super(source, options)
    super(source, options)
  end
end
