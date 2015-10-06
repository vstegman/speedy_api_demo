class ScoreStat

  def initialize(relation)
    @scores = relation.as_struct
  end

  def mean
    sum = 0
    @scores.each {|s| sum += s.value}
    sum / @scores.length
  end

  def to_hash
    {
      count: @scores.length,
      mean: mean
    }
  end
end
