require 'ffaker'

class User
  attr_reader :username, :password, :firstname, :lastname, :email, :position

  def initialize
    @username = FFaker::Random.rand.to_s
    @password = FFaker::Internet.password
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @email = username + firstname + '@example.org'
    @position = ''
  end

  def == (other)
    self.username == other.username &&
    self.name == other.name &&
    self.email == other.email
  end

  def name
    firstname + ' ' + lastname
  end

  def position(position)
    @position = position
  end

  def to_json
    {
      :username => @username,
      :password => @password,
      :firstname => @firstname,
      :lastname => @lastname,
      :email => @email,
      :position => @position
    }.to_json
  end

end

