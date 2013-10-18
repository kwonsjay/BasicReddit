require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :username, :password, :session_token, :email
  validates_presence_of :username, :password_digest, :session_token, :email
  validates_uniqueness_of :username, :session_token, :email

  before_validation do
    self.session_token ||= self.class.generate_session_token
  end

  has_many :subs
  has_many :links

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
