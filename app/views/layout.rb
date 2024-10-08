# frozen_string_literal: true

class Views::Layout < Components::Base
  def around_template
    doctype

    html do
      render Shared::Head.new

      body do
        render Components::Shared::Navbar.new
        main(class: "relative") { yield }
        render Components::Shared::Flashes.new(notice: helpers.flash[:notice], alert: helpers.flash[:alert])
      end
    end
  end
end
