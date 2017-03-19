class User < ActiveRecord::Base

  include BCrypt
  belongs_to :company
  has_many :sent_emails, class_name: "Email", foreign_key: "sender_id"
  has_many :received_emails, class_name: "Email", foreign_key: "recipient_id"
  # has_many :cc_emails, class_name: "Email", foreign_key: "cc"
  # has_many :bcc_emails, class_name: "Email", foreign_key: "bcc"

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
