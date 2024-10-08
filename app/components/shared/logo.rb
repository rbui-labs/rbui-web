# frozen_string_literal: true

class Components::Shared::Logo < ApplicationComponent
  def view_template
    a(href: helpers.root_url, class: "mr-6 flex items-center space-x-2") do
      TypographyH4(class: "flex items-center") {
        img(src: helpers.image_url("logo.svg"), class: "h-4 block dark:hidden")
        img(src: helpers.image_url("logo_dark.svg"), class: "h-4 hidden dark:block")
        span(class: "sr-only") { "RBUI" }
        Badge(variant: :amber, size: :sm, class: "ml-2 whitespace-nowrap") { "Pre Release" }
      }
    end
  end
end
