class GroupedScore
  def initialize(relation)
    scores = relation.as_struct
    @scores = scores.group_by {|s| s.game_id}
  end

  def run_stats
    @stats = []
    @scores.each do |k,v|
      score = v.map(&:value)
      @stats << AdvancedStat.new(score)
    end
    @stats
  end

end
