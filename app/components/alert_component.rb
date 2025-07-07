class AlertComponent < ViewComponent::Base
  def initialize(message:, variant: :info)
    @message = message
    @variant = variant
  end

  private

  attr_reader :message, :variant

  def container_classes
    base_classes = "flex items-start gap-3 p-4 rounded-lg border"

    variant_classes = case variant
    when :info
      "bg-neutral text-primary border-brand"
    when :success
      "bg-neutral text-primary border-[#10b981]"
    when :warning
      "bg-yellow-50 text-yellow-800 border-yellow-300"
    when :error, :destructive
      "bg-red-50 text-red-700 border-red-200"
    end

    "#{base_classes} #{variant_classes}"
  end

  def icon_name
    case variant
    when :info
      "info"
    when :success
      "check-circle"
    when :warning
      "alert-triangle"
    when :error, :destructive
      "x-circle"
    end
  end

  def icon_color
    case variant
    when :success
      "#10b981"
    when :warning
      "yellow-600"
    when :error, :destructive
      "red-600"
    else
      "#1a365d" # primary navy
    end
  end
end
