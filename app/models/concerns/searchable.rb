module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filter_params)
      filter_params_keys = filter_params.symbolize_keys
      results = self.where(nil)
      filter_params_keys.each do |key, value|
        results = results.where(self.arel_table[key].matches("%#{value}%"))
      end
      return results
    end
  end
end
