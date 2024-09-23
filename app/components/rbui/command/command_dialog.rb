# frozen_string_literal: true

module RBUI
  class CommandDialog < Base
    def initialize(open: false, **attrs)
      @open = open
      super(**attrs)
    end

    def view_template(&)
      div(**attrs, &)
    end

    private

    def default_attrs
      {
        data: {
          controller: "rbui--command-dialog",
          rbui__alert_dialog_open_value: @open.to_s
        }
      }
    end
  end
end
