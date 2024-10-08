require "test_helper"

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  def self.all_docs_routes
    scope_prefix = "/docs"

    Rails.application.routes.routes.select do |route|
      route.path.spec.to_s.start_with?(scope_prefix)
    end.map do |route|
      {
        method: route.verb,
        path: route.path.spec.to_s.sub(/\(\.:format\)\z/, ""),
        controller: route.defaults[:controller],
        action: route.defaults[:action]
      }
    end
  end

  all_docs_routes.each do |route|
    test "should get #{route[:action]}" do
      get route[:path]
      assert_response :success, lambda {
        "Route failed: #{route[:method]} #{route[:path]} (#{route[:controller]}##{route[:action]})\n" \
          "Expected response to be a <2XX: success>, but was a <#{response.code}: #{Rack::Utils::HTTP_STATUS_CODES[response.code.to_i]}>"
      }
    end
  end
end
