class User < ActiveRecord::Base

  has_many :restaurants
  has_many :reviews
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    end
	end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def has_reviewed?(restaurant)
    reviewed_restaurants.include?(restaurant)
  end

end
