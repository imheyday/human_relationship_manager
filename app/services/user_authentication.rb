class UserAuthentication
  attr_reader :access_token, :refresh_token

  def initialize(oauth)
    @access_token = oauth.access_token
    @refresh_token = oauth.refresh_token
  end

  def auth!
    user_info = userinfo
    return false if user_info['id'].nil?
    authentication = find_authentification(user_info['id'])
    authentication.update_attributes(token: @access_token, refresh_token: @refresh_token)
    user = manage_user!(auth: authentication, user_info: user_info)
    user
  end

  private

  def find_authentification(id)
    Authentication.find_or_create_by(uid: id)
  end

  def userinfo
    GoogleApi.new(@access_token).userinfo
  end

  def manage_user!(auth:, user_info:)
    user = auth.user
    return user if user
    user = User.find_by(email: user_info['email']) || User.create_with_password(email: user_info['email'])
    auth.update_attributes(user_id: user.id)
    user
  end

end
