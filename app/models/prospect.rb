class Prospect < ActiveRecord::Base
  validates_presence_of :name,:address,:city,:due_date
  has_one :stage
  has_one :user_id 
end
