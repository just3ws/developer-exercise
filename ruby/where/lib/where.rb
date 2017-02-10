# frozen_string_literal: true

require_relative 'where/version'

module Where
  def self.subset?(left, right)
    left > right
  end

  def self.intersected?(left, right)
    subset?(
      left.clone.keep_if { |k, _v| right.keys.include?(k) },
      right.clone.keep_if { |k, _v| left.keys.include?(k) }
    )
  end

  def self.regexps?(left, right)
    regexps = right.clone.keep_if { |_k, v| v.is_a?(Regexp) }
    return regexps.all? { |k, v| v =~ left[k] } unless regexps.empty?
  end

  def self.strings?(left, right)
    strings = right.clone.keep_if { |_k, v| v.is_a?(String) }
    return strings.all? { |k, v| v == left[k] } unless strings.nil? || strings.empty?
  end

  def self.numbers?(left, right)
    numbers = right.clone.keep_if { |_k, v| v.is_a?(Integer) }
    return numbers.all? { |k, v| v == left[k] } unless numbers.nil?
  end
end

# NOTE: Assuming shallow hashes

module Enumerable
  def where(criteria = {})
    return enum_for(:find_all) if criteria.empty?
    # return enum_for(:find_all) unless block_given?

    pattern = Hash[criteria.map { |(k, v)| [k.to_sym, v] }]

    find_all do |quote|
      if Where.subset?(quote, pattern)
        true
      elsif Where.intersected?(quote, pattern)
        true
      else
        bits = [
          Where.regexps?(quote, pattern),
          Where.strings?(quote, pattern),
          Where.numbers?(quote, pattern)
        ].compact

        !bits.empty? && bits.all?
      end
    end
  end
end
