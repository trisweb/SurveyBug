class Question < ActiveRecord::Base
  has_many :options
  
  attr_accessor :text
  attr_accessor :order
end
