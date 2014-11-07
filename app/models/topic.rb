class Topic < ActiveRecord::Base
	has_many :posts, ->{ order("position DESC")}, dependent: :destroy
end
