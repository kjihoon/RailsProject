class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :comments
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  #User.find_auth
  def self.find_auth(auth)
    #Identity가 있는지에 대한 로직
    #identity에 uid랑 provider 정보가 일치하는게 없으면 nil(new만든다) 일치하면 user obj 리턴
    identity = Identity.find_auth(auth)


    user = identity.user
    #user가 있는지에 대한 로직
    #
    if user.nil?
      user = User.find_by(email: auth.info.email)
    if user.nil?
       user = User.new(
         email: auth.info.email,
         name: auth.info.name,
         password: Devise.friendly_token[0,20],
         profile_img: auth.info.image
       )
     end
       user.save!
    end

    if identity.user !=user
      identity.user = user
      identity.save!
    end
    user
  end
end
