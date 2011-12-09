class Survey < ActiveRecord::Base
  has_many :questions
  has_many :results
  
  attr_accessor :survey_data # For temporarily storing JSON data, allowing for a simple hidden field to take care of it.
end
