# frozen_string_literal: true

module Strategies
  class SortMostViewed < Base
    def call
      data.group_by(&:path)
          .transform_values(&:length)
          .sort_by { |_, count| count }
          .reverse
          .to_h
    end
  end
end
