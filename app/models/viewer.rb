class Viewer < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :user_id, :party_id, presence: true
end
