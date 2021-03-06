class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:token) }

  has_many :activities, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end
end
