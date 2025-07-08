# app/components/link_component.rb
class LinkComponent < ViewComponent::Base
  def initialize(
    href:, text: nil, classes: nil, target: nil, method: nil, rel: nil,
    icon: nil, variant: "primary", size: "base", full_width: false, **options
  )
    @href = href
    @text = text
    @classes = classes
    @target = target
    @method = method
    @rel = rel
    @icon = icon
    @variant = variant
    @size = size
    @full_width = full_width
    @options = options
  end

  def call
    link_to href, **link_options do
      tag.span(class: "flex items-center justify-center gap-2") do
        safe_join([icon_tag, text.to_s].compact)
      end
    end
  end

  private

  attr_reader :href, :text, :target, :method, :rel, :icon, :variant, :size, :full_width, :options

  def link_options
    {
      class: final_classes,
      target: target,
      method: method,
      rel: rel
    }.merge(@options).compact
  end

  def final_classes
    [
      base_style,
      variant_class,
      size_class,
      ("w-full" if full_width),
      classes
    ].compact.join(" ")
  end

  def base_style
    "inline-flex items-center rounded-lg font-semibold focus:outline-none focus:ring-2 focus:ring-offset-2 transition"
  end

  def variant_class
    case variant
    when "primary"
      "bg-green-600 hover:bg-green-700 text-white focus:ring-green-500"
    when "secondary"
      "bg-white border border-gray-300 text-gray-700 hover:bg-gray-50 focus:ring-gray-500"
    else
      ""
    end
  end

  def size_class
    case size
    when "sm" then "px-3 py-1.5 text-sm"
    when "lg" then "px-6 py-3 text-base"
    else "px-4 py-2 text-sm"
    end
  end

  def icon_tag
    return unless icon.present?

    tag.svg(
      nil,
      class: "w-4 h-4",
      data: { icon: icon }
    )
  end
end
