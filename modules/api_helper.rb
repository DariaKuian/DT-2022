module APIHelper
  @token = 'FKzy_BpV5wAybKf7Z9JX'
  @base_url = 'https://gitlab.testautomate.me/api/v4'
  @headers = {Authorization: "Bearer #{@token}" }

  def self.get_user(username)
    RestClient.get("#{@base_url}/users?username=#{username}", @headers)
  end

  def self.sign_up(user)
    payload = {
      "name": user.name,
      "username": user.username,
      "email": user.email.downcase!,
      "password": user.password,
      "skip_confirmation": true,
    }

    RestClient.post("#{@base_url}/users", payload, @headers)
  end

  def self.delete(user)
    RestClient.delete("#{@base_url}/users/#{user.id}", @headers)
  end
end