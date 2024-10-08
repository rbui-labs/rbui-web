# frozen_string_literal: true

class Views::Docs::Typography < Components::Layouts::Docs
  def page_title = "Typography"

  def view_template
    component = "Typography"

    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: "Typography", description: "Sensible defaults to use for text.")

      TypographyH2 { "Usage" }

      render Docs::VisualCodeExample.new(title: "h1", context: self) do
        <<~RUBY
          TypographyH1 { "This is an H1 title" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "h2", context: self) do
        <<~RUBY
          TypographyH2 { "This is an H2 title" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "h3", context: self) do
        <<~RUBY
          TypographyH3 { "This is an H3 title" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "h4", context: self) do
        <<~RUBY
          TypographyH4 { "This is an H4 title" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "p", context: self) do
        <<~RUBY
          TypographyP { "This is an P tag" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Inline Link", context: self) do
        <<~RUBY
          TypographyP(class: 'text-center') do
            plain "Checkout our "
            TypographyInlineLink(href: helpers.docs_installation_path) { "installation instructions" }
            plain " to get started."
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "List", context: self) do
        <<~RUBY
          TypographyList(items: [
            'Phlex is fast',
            'Phlex is easy to use',
            'Phlex is awesome',
          ])
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Numbered List", context: self) do
        <<~RUBY
          TypographyList(items: [
            'Copy',
            'Paste',
            'Customize',
          ], numbered: true)
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Inline Code", context: self) do
        <<~RUBY
          TypographyInlineCode { "This is an inline code block" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Lead", context: self) do
        <<~RUBY
          TypographyLead { "A modal dialog that interrupts the user with important content and expects a response." }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Large", context: self) do
        <<~RUBY
          TypographyLarge { "Are you sure absolutely sure?" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Small", context: self) do
        <<~RUBY
          TypographySmall { "Email address" }
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Muted", context: self) do
        <<~RUBY
          TypographyMuted { "Enter your email address." }
        RUBY
      end

      render Docs::ComponentsTable.new(component_references(component, Docs::VisualCodeExample.collected_code), component_files(component))
    end
  end
end
