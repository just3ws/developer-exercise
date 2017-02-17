# frozen_string_literal: true

module Questions
  module Text
    def clean(str)
      trim(str.to_s).downcase
    end

    def trim(str)
      str.to_s.chomp.strip
    end

    def titleize(str)
      str.to_s.chomp.strip.split(/\s+/).map(&:capitalize).join(' ')
    end
  end
end
