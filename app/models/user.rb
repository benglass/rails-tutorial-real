
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z\d]\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  before_save :normalize_email

  private
    def normalize_email
      self.email = email.downcase
    end

end
