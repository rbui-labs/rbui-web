class Components::Layouts::Base < Components::Base
  include Components

  PageInfo = Data.define(:title)

  def around_template
    doctype

    html do
      render Components::Shared::Head.new(page_info)

      body do
        render Shared::Navbar.new
        yield # This will render the content of child layouts/views
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
