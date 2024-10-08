# frozen_string_literal: true

class Views::HomeView::Banner < Views::Base
  include Phlex::DeferredRender

  def view_template(&block)
    div(class: "relative overflow-hidden") do
      render Components::Shared::GridPattern.new(spacing: :md)
      render Views::HomeView::Shapes.new(size: :xl, color: :pink, class: "hidden sm:block absolute right-0 top-1/2 transform -translate-y-1/2 sm:translate-x-2/3 md:translate-x-1/2")
      div(class: "relative container mx-auto max-w-3xl py-24 lg:py-32 px-4 sm:text-center flex flex-col sm:items-center gap-y-6") do
        TypographyH1 do
          plain "A UI component library, crafted precisely for Ruby devs"
          span(class: "text-foreground opacity-30") { " who want to stay organised and build modern apps, fast." }
        end
        if @cta
          div(class: "grid grid-cols-1 sm:grid-cols-2 gap-4", &@cta)
        end
      end
    end
  end

  def cta(&block)
    @cta = block
  end
end
