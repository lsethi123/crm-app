class Customer < ActiveRecord::Base
	has_many :emails
	has_many :notes
	validates_presence_of :name,:address,:city
end
