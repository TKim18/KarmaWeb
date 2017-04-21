class User < ApplicationRecord
	before_save :default_values
	def default_values
		self.circle_id ||= -1
	end
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
		    user.uid = auth.uid
		    user.name = auth.info.name
		    user.oauth_token = auth.credentials.token
		    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		    user.save!
	    end
	end

	def self.findCircleId(userId)
		# circle = User.where("uid = ?", userId).pluck(:circleName).first
		# Check if a user already has a circle
		# If the id is -1, then they do not
		current_user = User.find_by id: userId
		return current_user.circle_id
	end
end
