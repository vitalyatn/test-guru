class Feedback
  include ActiveModel::Model

  attr_accessor(
    :email,
    :body
  )

  validates :email, presence: true
  validates :body, presence: true

end
