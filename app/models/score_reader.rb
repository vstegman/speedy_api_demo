class ScoreReader
  attr_reader :value, :date, :user_id, :game_id
  def initialize(args)
    @value = args[0]
    @date = args[1]
    @user_id = args[2]
    @game_id = args[3]
  end

  def self.build_from_relation(relation)
    arr = relation.pluck(:value, :date, :user_id, :game_id)
    obj = []
    arr.each {|r| obj << ScoreReader.new(r)}
    obj
  end

  def as_json
    {value: @value, date: @date, user_id: @user_id, game_id: @game_id}
  end

end
