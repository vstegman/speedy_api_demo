# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  value      :integer
#  date       :date
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  SCORE_STRUCT = Struct::Score

#  Step 1: Be more specific
  def as_json(args = nil)
    {value: value, date: date, user_id: user_id, game_id: game_id}
  end
#
  def self.as_struct
    arr = pluck(:value, :date, :user_id, :game_id)
    structs = []
    arr.each {|cf| structs << SCORE_STRUCT.new(cf[0],cf[1],cf[2], cf[3])}
    structs
  end

end
