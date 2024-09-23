# frozen_string_literal: true

module RBUI
  class Button < Base
    def initialize(type: :button, variant: :primary, size: :md, icon: false, **attrs)
      @type = type
      @variant = variant.to_sym
      @size = size.to_sym
      @icon = icon
      super(**attrs)
    end

    def view_template(&block)
      button(**attrs) do
        span(class: "relative z-10 px-2 py-[2px]", &block)
        horizontal_line(position: :top)
        horizontal_line(position: :bottom)
        vertical_line(position: :left)
        vertical_line(position: :right)
      end
    end

    private

    def horizontal_line(position:)
      span(class: "absolute #{position}-[10px] left-0 right-0 border-t border-dotted border-gray-700 opacity-0 transition-opacity duration-200 group-hover:opacity-100")
    end

    def vertical_line(position:)
      span(class: "absolute #{position}-[10px] top-0 bottom-0 border-l border-dotted border-gray-700 opacity-0 transition-opacity duration-200 group-hover:opacity-100")
    end

    def size_classes
      if @icon
        case @size
        when :sm then "h-6 w-6"
        when :md then "h-9 w-9"
        when :lg then "h-10 w-10"
        when :xl then "h-12 w-12"
        end
      else
        case @size
        when :sm then "px-3 py-1.5 h-8 text-xs"
        when :md then "px-4 py-2 h-9 text-sm"
        when :lg then "px-4 py-2 h-10 text-base"
        when :xl then "px-6 py-3 h-12 text-base"
        end
      end
    end

    def primary_classes
      tokens(
        "group relative whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 bg-black text-white text-primary-foreground shadow hover:bg-primary/90",
        size_classes
      )
    end

    # ... (keep other variant classes as they were)

    def default_classes
      case @variant
      when :primary then primary_classes
      when :link then link_classes
      when :secondary then secondary_classes
      when :destructive then destructive_classes
      when :outline then outline_classes
      when :ghost then ghost_classes
      end
    end

    def default_attrs
      {
        type: @type,
        class: default_classes
      }
    end
  end
end
