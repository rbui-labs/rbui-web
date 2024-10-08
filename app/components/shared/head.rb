# frozen_string_literal: true

class Components::Shared::Head < Components::Base
  include Phlex::Rails::Layout
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::StylesheetLinkTag

  def initialize(page_info)
    @page_info = page_info
  end

  def view_template
    head do
      title { "RBUI - " + @page_info.title }
      meta name: "viewport", content: "width=device-width,initial-scale=1"
      meta name: "turbo-refresh-method", content: "morph"
      meta name: "turbo-refresh-scroll", content: "preserve"
      meta name: "view-transition", content: "same-origin"
      csp_meta_tag
      csrf_meta_tags
      stylesheet_link_tag "https://api.fontshare.com/v2/css?f[]=general-sans@1&display=swap", data_turbo_track: "reload"
      stylesheet_link_tag "application", data_turbo_track: "reload"
      javascript_include_tag "application", data_turbo_track: "reload", defer: true
    end
  end
end
