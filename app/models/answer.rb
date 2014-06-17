class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool

  def player
    answer_one
  end

  def team
    Team.find(answer_two).name if answer_two.present?
  end

  def self.on_pool(pool)
    where(pool_id: pool.id).first
  end

  def self.create_answer_for(user, pool)
    attributes = {pool: pool, user: user}
    create(attributes) unless exists?(attributes)
  end
end
