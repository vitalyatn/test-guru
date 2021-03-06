class Bage < ApplicationRecord

  has_one_attached :image, dependent: :destroy

  has_many :received_bages, dependent: :destroy
  has_many :users, through: :received_bages

end
