class AdvancedStat

  def initialize(relation)
    if(relation.is_a? ActiveRecord::Relation)
      @stats = DescriptiveStatistics::Stats.new(relation.pluck(:value))
    else
      @stats = DescriptiveStatistics::Stats.new(relation)
    end
  end

  def to_hash
    {
      count: @stats.length,
      mean: @stats.mean,
      skill_score: @stats.mean / @stats.standard_deviation
    }
  end

end
