require 'ffaker'

class User
  attr_reader :username, :password, :firstname, :lastname, :email

  def initialize
    @username = FFaker::Random.rand.to_s
    @password = FFaker::Internet.password
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @email = username + firstname + '@example.org'
  end
end

