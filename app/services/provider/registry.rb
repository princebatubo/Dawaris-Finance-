module Provider
  class Registry
    def self.get_provider(name)
      case name
      when :github
        OpenStruct.new(fetch_latest_release_notes: {
          avatar: "https://github.com/maybe-finance.png",
          username: "maybe-finance",
          name: "Mock Release",
          published_at: Date.current,
          body: "Mock release notes"
        })
      else
        raise "Unknown provider: #{name}"
      end
    end
  end
end
