class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :complete, presence: true
	belongs_to :list
end
