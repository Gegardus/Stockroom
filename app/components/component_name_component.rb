# frozen_string_literal: true

class ComponentNameComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
