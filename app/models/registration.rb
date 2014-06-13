class Registration < ActiveRecord::Base
  ### Relations
  belongs_to :pool
  ### Validations
  validates_presence_of :name, :last_name, :phone, :email, :pool_id
  validates_uniqueness_of :email, :nickname


end
