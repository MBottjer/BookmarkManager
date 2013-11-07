class User 

  require 'bcrypt'

  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial 
  property :email, String, :unique => true, :message => "This email is already taken"
  property :password_digest, Text 
  property :name, String 

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password 
  validates_uniqueness_of :email

end