class Contact < ActiveRecord::Base
  belongs_to :customer 
  belongs_to :user
  has_many :emails
end
