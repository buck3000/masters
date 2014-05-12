class User < ActiveRecord::Base
	
	validate :email, presence: true
	validate :name, presence: true

	has_many :teams


	include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
