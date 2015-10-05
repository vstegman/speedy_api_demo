class ScoreStat

  def initialize(relation)
    @stats = DescriptiveStatistics::Stats.new(relation.pluck(:value))
  end

  def to_hash
    {
      count: @stats.length,
      mean: @stats.mean,
      skill_score: @stats.mean / @stats.standard_deviation
    }
  end
end
