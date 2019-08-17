# frozen_string_literal: true

require_relative 'lib/score_calculation'

class DhhScore
  DHH_USER = 'dhh'

  def print_score
    puts "#{DHH_USER.upcase}'s github score is #{ScoreCalculation.new(DHH_USER).total_score}"
  end
end

DhhScore.new.print_score
