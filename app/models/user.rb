class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

   has_many :authorizations
   validates :name, :email, :presence => true

   def self.from_omniauth(auth)
    Rails.logger.info "\n\ninside model info: #{auth.info.inspect}\n\n"
  	 where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	    # so clearly we can't use this email forever 
        # it is just acting as proof that if facebook provides us with an email 
        # that our user DOES get registered.
        # next up - sleuthe on solutions for why facebook doesnt provide us with email 
        # and/or the fix for it
        user.email = 'testemail@test.com'
  	    user.password = Devise.friendly_token[0,20]
  	    user.name = auth.info.name   # assuming the user model has a name
        # set users email as confirmed so that you get logged in for real

  	 end
   end
end
