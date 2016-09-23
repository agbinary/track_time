class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(uid: auth_hash.uid).first_or_create
    user.update(
      nickname: auth_hash.info.nickname,
      name: auth_hash.info.name,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end
end
