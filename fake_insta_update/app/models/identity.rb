class Identity < ActiveRecord::Base
  belongs_to :user
  def self.find_auth(auth)
    provider: auth.provider,
    uid: auth.uid
  end

end
