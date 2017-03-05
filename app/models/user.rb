class User < ActiveRecord::Base

  include BCrypt

  before_save :create_hashed_password, if: :password_changed?
  validates_length_of :password, minimum: 6, if: :password_changed?

  def create_hashed_password
    if password
      self.password = Password.create(password)
    end
  end

  def full_name
    "#{firstname} #{lastname}"
  end
end
