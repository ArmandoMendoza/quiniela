class Register < ActiveRecord::Base
  ### Relations
  belongs_to :pool
  ### Validations
  validates_presence_of :name, :phone, :email, :pool_id
  validates_uniqueness_of :phone, :email
end
