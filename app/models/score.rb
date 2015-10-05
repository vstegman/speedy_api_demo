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

  SCORE_STRUCT = Struct.new('Score', :value, :date, :user_id, :game_id)


  def self.as_struct(struct = nil)
    struct ||= SCORE_STRUCT
    arr = pluck(:value, :date, :user_id, :game_id)
    structs = []
    arr.each {|cf| structs << struct.new(cf[0],cf[1],cf[2], cf[3])}
    structs
  end

end
