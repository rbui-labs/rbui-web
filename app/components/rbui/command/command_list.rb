# frozen_string_literal: true

require "securerandom"

module RBUI
  class CommandList < Base
    def initialize(**attrs)
      @id = "list#{SecureRandom.hex(4)}"
      super
    end

    def view_template(&)
      div(**attrs, &)
    end

    private

    def default_attrs
      {
        id: @id,
        data: {
          rbui__command_target: "list"
        },
        role: "listbox",
        tabindex: "-1",
        class: "max-h-80 overflow-scroll divide-y divide-border"
      }
    end
  end
end
