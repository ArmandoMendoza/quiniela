class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool

  def self.on_pool(pool)
    where(pool_id: pool.id).first
  end

  def player
    answer_one
  end

  def team
    Team.find(answer_two).name
  end
end
