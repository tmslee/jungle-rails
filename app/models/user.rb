class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true, length: {minimum: 5}
 
  def password_validate
    if password != password_confirmation
      errors.add(:password, "Password confirm must match password")
    end
  end

  def self.authenticate_with_credentials (email, password)
    email.strip!
    db_user = User.where("LOWER(email) LIKE  '#{email.downcase}'")[0]
    if !db_user.nil? && db_user&.authenticate(password) 
      return db_user
    end 
    return nil
  end
end
