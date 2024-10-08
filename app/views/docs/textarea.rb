# frozen_string_literal: true

class Views::Docs::Textarea < Components::Layouts::Docs
  def page_title = "Textarea"

  def view_template
    component = "Textarea"

    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: "Textarea", description: "Displays a textarea field.")

      TypographyH2 { "Usage" }

      render Docs::VisualCodeExample.new(title: "Textarea", context: self) do
        <<~RUBY
          div(class: "grid w-full max-w-sm items-center gap-1.5") do
            Textarea(placeholder: "Textarea")
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Disabled", context: self) do
        <<~RUBY
          div(class: "grid w-full max-w-sm items-center gap-1.5") do
            Textarea(disabled: true, placeholder: "Disabled")
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "With FormField", context: self) do
        <<~RUBY
          div(class: "grid w-full max-w-sm items-center gap-1.5") do
            FormField do
              FormFieldLabel(for: "textarea") { "Textarea" }
              FormFieldHint { "This is a textarea" }
              Textarea(placeholder: "Textarea", id: "textarea")
              FormFieldError()
            end
          end
        RUBY
      end
    end

    render Docs::ComponentsTable.new(component_references(component, Docs::VisualCodeExample.collected_code), component_files(component))
  end
end
