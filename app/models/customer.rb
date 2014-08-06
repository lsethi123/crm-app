class Customer < ActiveRecord::Base
	has_many :emails
	has_many :notes
	has_many :contacts
	belongs_to :user
	validates_presence_of :name,:address,:city,:user_id
end
