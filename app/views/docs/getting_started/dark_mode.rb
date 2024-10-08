# frozen_string_literal: true

class Views::Docs::GettingStarted::DarkMode < Components::Layouts::Docs
  def page_title = "Dark mode"

  def view_template
    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: "Dark mode", description: "How to use dark mode in your application")

      div(class: "space-y-4") do
        heading2 { "How it works" }
        TypographyP { "RBUI seamlessly integrates dark mode, a crucial feature for modern applications, enhancing user experience and catering to diverse user preferences." }
        TypographyP do
          plain "RBUI is setup to use the "
          TypographyInlineLink(href: "https://tailwindcss.com/docs/dark-mode#toggling-dark-mode-manually") { "TailwindCSS 'class' strategy" }
          plain ". This means that you can toggle dark mode by adding or removing the "
          TypographyInlineCode { "dark" }
          plain " class from the "
          TypographyInlineCode { "<body>" }
          plain " element."
        end
        TypographyP { "To enable dark mode, follow the installation below." }
      end

      div(class: "space-y-4") do
        heading2 { "Installation" }
        TypographyP do
          plain "To implement Dark mode, add the "
          TypographyInlineCode { "ThemeToggle" }
          plain " component (below) to your application layout file. This ensures it's available on all pages."
        end
        TypographyP do
          plain "This component is a button that toggles the "
          TypographyInlineCode { "dark" }
          plain " class on the "
          TypographyInlineCode { "<body>" }
          plain " element, using the "
          TypographyInlineCode { "ToggleThemeController" }
          plain " Stimulus controller."
        end
        Alert do
          AlertTitle { "Pro tip" }
          AlertDescription do
            plain "You can hide the theme toggle on specific pages, like so: "
            TypographyInlineCode { "ThemeToggle(class: 'hidden')" }
            plain "."
          end
        end

        div(class: "pt-4") do
          render Components::Docs::VisualCodeExample.new(title: "Toggle component", context: self) do
            <<~RUBY
              ThemeToggle do |toggle|
                toggle.light_mode do
                  Button(variant: :outline, icon: true) do
                    svg(
                      xmlns: "http://www.w3.org/2000/svg",
                      viewbox: "0 0 24 24",
                      fill: "currentColor",
                      class: "w-4 h-4"
                    ) do |s|
                      s.path(
                        d:
                          "M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.894 6.166a.75.75 0 00-1.06-1.06l-1.591 1.59a.75.75 0 101.06 1.061l1.591-1.59zM21.75 12a.75.75 0 01-.75.75h-2.25a.75.75 0 010-1.5H21a.75.75 0 01.75.75zM17.834 18.894a.75.75 0 001.06-1.06l-1.59-1.591a.75.75 0 10-1.061 1.06l1.59 1.591zM12 18a.75.75 0 01.75.75V21a.75.75 0 01-1.5 0v-2.25A.75.75 0 0112 18zM7.758 17.303a.75.75 0 00-1.061-1.06l-1.591 1.59a.75.75 0 001.06 1.061l1.591-1.59zM6 12a.75.75 0 01-.75.75H3a.75.75 0 010-1.5h2.25A.75.75 0 016 12zM6.697 7.757a.75.75 0 001.06-1.06l-1.59-1.591a.75.75 0 00-1.061 1.06l1.59 1.591z"
                      )
                    end
                  end
                end

                toggle.dark_mode do
                  Button(variant: :outline, icon: true) do
                    svg(
                      xmlns: "http://www.w3.org/2000/svg",
                      viewbox: "0 0 24 24",
                      fill: "currentColor",
                      class: "w-4 h-4"
                    ) do |s|
                      s.path(
                        fill_rule: "evenodd",
                        d:
                          "M9.528 1.718a.75.75 0 01.162.819A8.97 8.97 0 009 6a9 9 0 009 9 8.97 8.97 0 003.463-.69.75.75 0 01.981.98 10.503 10.503 0 01-9.694 6.46c-5.799 0-10.5-4.701-10.5-10.5 0-4.368 2.667-8.112 6.46-9.694a.75.75 0 01.818.162z",
                        clip_rule: "evenodd"
                      )
                    end
                  end
                end
              end
            RUBY
          end
        end
      end
    end
  end

  def heading2(&)
    TypographyH2(class: "!text-2xl pb-4 border-b", &)
  end

  def space_y_4(&)
    div(class: "space-y-4", &)
  end

  def space_y_2(&)
    div(class: "space-y-2", &)
  end
end
