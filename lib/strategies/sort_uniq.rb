# frozen_string_literal: true

module Strategies
  class SortUniq < Base
    def call
      uniq_objects.group_by(&:path)
                  .transform_values(&:length)
                  .sort_by { |_, count| count }
                  .reverse
                  .to_h
    end

    private

    def uniq_objects
      data.uniq(&:to_a)
    end
  end
end
