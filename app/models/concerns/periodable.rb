# app/models/concerns/periodable.rb
module Periodable
  extend ActiveSupport::Concern

  included do
    def period_range(period_key)
      Period.from_key(period_key)
    end
  end
end
