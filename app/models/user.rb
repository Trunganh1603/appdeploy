class User < ApplicationRecord
  acts_as_voter
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	validates :user_name, presence: true, length: {minimum: 4, maximum: 16}

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

  	def follow(user_id)
    	following_relationships.create(following_id: user_id)
  	end

  	def unfollow(user_id)
    	following_relationships.find_by(following_id: user_id).destroy
  	end

    def peoples_i_follow
        Relationship.where (follower_id :id).pluck(:following_id)
    end

end
