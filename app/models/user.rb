class User < ActiveRecord::Base
  validates :uid, :nickname, :name, :token, :secret, presence: true

  has_many :activities
  has_many :projects
end
