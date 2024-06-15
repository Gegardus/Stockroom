# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
    def initialize(text:, style: 'default')
        @text = text
        @style = style
      end
end
