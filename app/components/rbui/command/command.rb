# frozen_string_literal: true

module RBUI
  class Command < Base
    def view_template(&)
      div(**attrs, &)
    end

    private

    def default_attrs
      {
        data: {
          controller: "rbui--command",
          # rbui__command_open_value: "false",
          # action: "click@window->rbui--command#onClickOutside",
          action: "keydown.enter->rbui--command#onKeyEnter keydown.esc->rbui--command#onEscKey keydown.down->rbui--command#onKeyDown keydown.up->rbui--command#onKeyUp",
          rbui__command_rbui__command_content_outlet: ".command-content",
          rbui__command_rbui__command_item_outlet: ".command-item"
        },
        class: "group/command pointer-events-auto grid w-full gap-4 border bg-background shadow-lg duration-200 sm:rounded-lg md:w-full"
      }
    end
  end
end
