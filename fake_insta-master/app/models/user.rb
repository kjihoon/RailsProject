class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :kakao]
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  # User.find_auth
  def self.find_auth(auth, signed_in_resource=nil)
    # Identity가 있는지?
    # identity에 uid랑 provider 정보가 일치하는 게 없으면,
    # 새로 만든다. => user는 nil이다.
    # 만약에 일치한다면, user_id가 있을 거니까 user 오브젝트가 리턴
    identity = Identity.find_auth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    # identity에 등록된 user가 있는지?
    if user.nil?
      user = User.find_by(email: auth.info.email)
      # User에 email 쓰고 있는 user가 있는지
      if user.nil?
        if auth.provider == 'kakao'
          user = User.new(
            name: auth.info.name,
            password: Devise.friendly_token[0,20],
            profile_img: auth.info.image
          )
        else
          user = User.new(
            email: auth.info.email,
            name: auth.info.name,
            password: Devise.friendly_token[0,20],
            profile_img: auth.info.image
          )
        end
      end
      user.save!
    end
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
  def email_required?
    false
  end
end
