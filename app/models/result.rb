class Result < ActiveRecord::Base
  belongs_to :survey
  
  validates :email, :presence => true
  validates :username, :presence => true
end
