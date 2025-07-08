# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(
    text:,
    variant: "primary",
    size: "md",
    icon: nil,
    type: "submit",
    full_width: false,
    onclick: nil,
    **options
  )
    @text = text
    @variant = variant
    @size = size
    @icon = icon
    @type = type
    @full_width = full_width
    @onclick = onclick
    @options = options
  end

  def call
    content_tag :button, **button_options do
      safe_join([icon_tag, text].compact, " ")
    end
  end

  private

  attr_reader :text, :variant, :size, :icon, :type, :full_width, :onclick, :options

  def button_options
    classes = ["btn", "btn-#{variant}", "btn-#{size}"]
    classes << "w-full" if full_width
    opts = options.dup
    opts[:class] = [*opts[:class], *classes].compact.join(" ")
    opts[:type] = type
    opts[:onclick] = onclick if onclick.present?
    opts
  end

  def icon_tag
    return nil unless icon.present?
    icon(icon, class: "w-4 h-4")
  end
end
