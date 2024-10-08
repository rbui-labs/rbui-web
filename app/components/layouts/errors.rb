class Components::Layouts::Errors < Components::Base
  include Components

  PageInfo = Data.define(:title)

  include Phlex::Rails::Layout

  def view_template(&block)
    doctype

    html do
      render Components::Shared::Head.new(page_info)

      body do
        main(class: "relative flex flex-col items-center justify-center gap-y-6 h-screen w-screen overflow-y-scroll") do
          render Shared::GridPattern.new
          ThemeToggle(class: "hidden") # In order for dark mode to work, we need to render the theme toggle somewhere in the DOM
          render Shared::Logo.new
          div(class: "container w-full max-w-md", &block)
        end
        render Shared::Flashes.new(notice: helpers.flash[:notice], alert: helpers.flash[:alert])
      end
    end
  end

  def page_info
    PageInfo.new(
      title: page_title
    )
  end
end
