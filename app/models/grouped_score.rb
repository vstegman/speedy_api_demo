class GroupedScore
  def initialize(relation)
    scores = relation.as_struct
    @scores = scores.group_by {|s| s.game_id}
    run_stats
  end

  def run_stats
    @stats = []
    @scores.each do |k,v|
      stat = AdvancedStat.new(v.map(&:value)).to_hash
      stat[:game_id] = k
      @stats << stat
    end
    @stats
  end

  def as_json
    @stats
  end

end
