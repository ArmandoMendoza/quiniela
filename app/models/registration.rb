class Registration < ActiveRecord::Base
  ### Relations
  belongs_to :pool
  ### Validations
  validates_presence_of :name, :phone, :email, :pool_id
  validates_uniqueness_of :email
  ### Callbacks
  before_save :set_nickname


  private
    def set_nickname
      self.nickname = name.underscore.gsub(" ", "_") unless nickname.present? and name.present?
    end
end
