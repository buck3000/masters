class User < ActiveRecord::Base
	
	validates :name, :length => { :minimum => 4, :message => "must be at least 4 characters, fool!" }
	validates :name, :email, presence: true
	validates :email, uniqueness: true, format: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/

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
