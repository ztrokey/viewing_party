class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy, foreign_key: :host_id
  has_many :viewers, dependent: :destroy
  validates :user_name, :email, :password_digest, presence: true
  validates :user_name, :email, uniqueness: true
  validates :email, format: %r/\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a
  -zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/

  has_secure_password
end
