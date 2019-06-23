class Gist < ApplicationRecord

  belongs_to :user, dependent: :destroy
  belongs_to :question, dependent: :destroy

  validates :url, presence: true
end
