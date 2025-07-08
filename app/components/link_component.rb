# app/components/link_component.rb
class LinkComponent < ViewComponent::Base
  def initialize(href:, text: nil, classes: nil, target: nil, method: nil, **options)
    @href = href
    @text = text
    @classes = classes
    @target = target
    @method = method
    @options = options
  end

  private

  attr_reader :href, :text, :target, :method, :options

  def classes
    @classes || ""
  end

  def link_options
    opts = @options.dup
    opts[:class] = classes if classes.present?
    opts[:target] = target if target.present?
    opts[:method] = method if method.present?
    opts
  end
end
