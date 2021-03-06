class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:twitter]

    has_many :helpful_links
    has_many :favourites
    after_create :send_notification

    validates_presence_of :username
    validates_uniqueness_of :username

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.username = auth.info.nickname
	    user.avatar = auth.info.image.sub("_normal", "")
	    # user.email = auth.info.email unless auth.info.email.blank?
	    # user.password = Devise.friendly_token[0,20]
	  end
	end

	def self.new_with_session(params, session)
	  if session["devise.user_attributes"]
	    new(session["devise.user_attributes"], without_protection: true) do |user|
	      user.attributes = params
	      user.valid?
	    end
	  else
	    super
	  end
	end

	def password_required?
	  super && provider.blank?
	end

	def update_with_password(params, *options)
	  if encrypted_password.blank?
	    update_attributes(params, *options)
	  else
	    super
	  end
	end

	def send_notification
		AdminMailer.new_user(self).deliver_now
		UserMailer.new_user_welcome(self).deliver_now
	end

end
