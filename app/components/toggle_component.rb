class ToggleComponent < ViewComponent::Base
  attr_reader :id, :name, :checked, :disabled, :checked_value, :unchecked_value, :opts

  def initialize(id:, name: nil, checked: false, disabled: false, checked_value: "1", unchecked_value: "0", **opts)
    @id = id
    @name = name
    @checked = checked
    @disabled = disabled
    @checked_value = checked_value
    @unchecked_value = unchecked_value
    @opts = opts
  end

  def label_classes
    class_names(
      "block w-10 h-6 cursor-pointer transition-colors duration-300 relative",
      "rounded-full bg-gray-200 dark:bg-gray-700",
      "after:content-[''] after:absolute after:bg-white after:rounded-full",
      "after:top-0.5 after:left-0.5 after:w-5 after:h-5",
      "after:transition-transform after:duration-300 after:ease-in-out",
      "peer-checked:bg-[#10b981]", # ✅ Dawaris Green
      "peer-checked:after:translate-x-4",
      "peer-disabled:opacity-60 peer-disabled:cursor-not-allowed"
    )
  end
end
