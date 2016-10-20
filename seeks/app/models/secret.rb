class Secret < ActiveRecord::Base

	belongs_to :user

	has_many :likes, dependent: :destroy

	has_many :users_liked, through: :likes, source: :user

	validates :content, :presence => true

	def find_like_id current_user
		Like.where(user: current_user , secret: self).first.id
	end
# lets go over it 

# self == to the instance of the secert that we're invoking 

# where will always return an array so it's important that we specify one element in that array


# So it should always be the first one right? We could also do something like 
end


# Like.where(user: current_user , secret: secret) this will always return an array
# so we have to do something like <>.first.oid
# First is used more often '
# I have another great assignment for you to do for practice 
