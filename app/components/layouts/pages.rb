# frozen_string_literal: true

class Components::Layouts::Pages < Components::Layouts::Base
  def around_template
    super do # Call the Base layout's template method
      main(class: "relative") { yield }
    end
  end
end
