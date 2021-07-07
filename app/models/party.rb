class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :viewers, dependent: :destroy
  has_many :users, through: :viewers

  validates :host_id, presence: true
end
