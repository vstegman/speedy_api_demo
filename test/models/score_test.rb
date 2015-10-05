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

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
