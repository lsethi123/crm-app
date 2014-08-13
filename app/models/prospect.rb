class Prospect < ActiveRecord::Base
  validates_presence_of :name,:address,:city
  has_one :stage
end
