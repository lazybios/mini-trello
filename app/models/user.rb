class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:token) }

  has_many :activities, :dependent => :destroy
  has_many :boards, :dependent => :destroy


  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
