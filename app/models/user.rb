class User < ApplicationRecord
	belongs_to :circle

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

	def self.findCircle(userId)
		circle = User.where("uid = ?", userId).pluck(:circleName).first
		if circle 
			return circle
		else
			return false
		end
	end
end
