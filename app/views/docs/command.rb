# frozen_string_literal: true

class Views::Docs::Command < Components::Layouts::Docs
  def page_title = "Command"

  def view_template
    component = "Command"
    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: "Command", description: "Fast, composable, unstyled command menu for Phlex.")

      TypographyH2 { "Usage" }

      render Docs::VisualCodeExample.new(title: "Example", context: self) do
        <<~RUBY
          CommandDialog do
            CommandDialogTrigger do
              Button(variant: "outline", class: 'w-56 pr-2 pl-3 justify-between') do
                div(class: "flex items-center space-x-1") do
                  search_icon
                  span(class: "text-muted-foreground font-normal") do
                    plain "Search"
                  end
                end
                ShortcutKey do
                  span(class: "text-xs") { "⌘" }
                  plain "K"
                end
              end
            end
            CommandDialogContent do
              Command do
                CommandInput(placeholder: "Type a command or search...")
                CommandEmpty { "No results found." }
                CommandList do
                  CommandGroup(title: "Components") do
                    components_list.each do |component|
                      CommandItem(value: component[:name], href: component[:path]) do
                        default_icon
                        plain component[:name]
                      end
                    end
                  end
                  CommandGroup(title: "Settings") do
                    settings_list.each do |setting|
                      CommandItem(value: setting[:name], href: setting[:path]) do
                        default_icon
                        plain setting[:name]
                      end
                    end
                  end
                end
              end
            end
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "With keybinding", context: self) do
        <<~RUBY
          CommandDialog do
            CommandDialogTrigger(keybindings: ['keydown.ctrl+j@window', 'keydown.meta+j@window']) do
              p(class: "text-sm text-muted-foreground") do
                span(class: 'mr-1') { "Press" }
                ShortcutKey do
                  span(class: "text-xs") { "⌘" }
                  plain "J"
                end
              end
            end
            CommandDialogContent do
              Command do
                CommandInput(placeholder: "Type a command or search...")
                CommandEmpty { "No results found." }
                CommandList do
                  CommandGroup(title: "Components") do
                    components_list.each do |component|
                      CommandItem(value: component[:name], href: component[:path]) do
                        default_icon
                        plain component[:name]
                      end
                    end
                  end
                  CommandGroup(title: "Settings") do
                    settings_list.each do |setting|
                      CommandItem(value: setting[:name], href: setting[:path]) do
                        default_icon
                        plain setting[:name]
                      end
                    end
                  end
                end
              end
            end
          end
        RUBY
      end

      render Docs::ComponentsTable.new(component_references(component, Docs::VisualCodeExample.collected_code), component_files(component))
    end
  end

  private

  def search_icon
    svg(
      xmlns: "http://www.w3.org/2000/svg",
      viewbox: "0 0 20 20",
      fill: "currentColor",
      class: "w-4 h-4 mr-1.5"
    ) do |s|
      s.path(
        fill_rule: "evenodd",
        d:
          "M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z",
        clip_rule: "evenodd"
      )
    end
  end

  def default_icon
    svg(
      xmlns: "http://www.w3.org/2000/svg",
      viewbox: "0 0 24 24",
      fill: "currentColor",
      class: "w-5 h-5"
    ) do |s|
      s.path(
        fill_rule: "evenodd",
        d:
          "M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z",
        clip_rule: "evenodd"
      )
    end
  end

  def components_list
    [
      {name: "Accordion", path: helpers.docs_accordion_path},
      {name: "Alert", path: helpers.docs_alert_path},
      {name: "Alert Dialog", path: helpers.docs_alert_dialog_path},
      {name: "Aspect Ratio", path: helpers.docs_aspect_ratio_path},
      {name: "Avatar", path: helpers.docs_avatar_path},
      {name: "Badge", path: helpers.docs_badge_path}
    ]
  end

  def settings_list
    [
      {name: "Profile", path: "#"},
      {name: "Mail", path: "#"},
      {name: "Settings", path: "#"}
    ]
  end
end
