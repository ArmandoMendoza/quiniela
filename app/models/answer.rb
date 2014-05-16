class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool
end
