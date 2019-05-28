class User < ApplicationRecord

  has_many :passed_tests, dependent: :destroy
  has_many :tests, dependent: :nullify
  has_many :tests, through: :passed_tests


  validates :email, :name, presence: true

  def test_list (level)
    tests.where(level: level)
  end

end
