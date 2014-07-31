class Customer < ActiveRecord::Base
	has_many :emails
	has_many :notes
	has_many :contacts
	validates_presence_of :name,:address,:city
end
