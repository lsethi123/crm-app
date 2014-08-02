class Contact < ActiveRecord::Base
  belongs_to :customer 
  has_many :emails
end
