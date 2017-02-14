# frozen_string_literal: true

module Rules
  class PointTotalRules
    attr_accessor :point_total, :upcard_token

    def initialize(params = {})
      @upcard_token = params[:upcard_token]
      @point_total  = params[:point_total]
    end

    def suggest
      print "CHECKING #{self.class.name.split('::').last} => "
      suggestion = if hit? then :hit if hit?
                   elsif stand? then :stand if stand?
                   else :indeterminate
                   end
      puts suggestion
      suggestion
    end

    def hit?
      return true if %w(5 6 7 8 9 10 11).include?(point_total)
      return true if %w(12).include?(point_total) && %w(2 3).include?(upcard_token)
      return true if %w(12).include?(point_total) && %w(7 8 9 10 A).include?(upcard_token)
      %w(13 14 15 16).include?(point_total) && %w(7 8 9 10 A).include?(upcard_token)
    end

    def stand?
      return true if %w(17 18 19 20).include?(point_total)
      return true if %w(12).include?(point_total) && %w(4 5 6).include?(upcard_token)
      %w(13 14 15 16).include?(point_total) && %w(2 3 4 5 6).include?(upcard_token)
    end
  end
end
