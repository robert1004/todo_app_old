class Todo < ActiveRecord::Base
	enum status:[:active,:completed]
	validates :content, presence: true
end
