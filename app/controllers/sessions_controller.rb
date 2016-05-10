class SessionsController < Clearance::SessionsController
  def new
    @google_auth_path = GoogleClient.new.auth_url
  end

  def auth_with_google
    user = find_user(request['code'])
    if user
      sign_in(user)
      notice = t('success.messages.google_auth')
    else
      notice = t('error.messages.google_auth')
    end
    redirect_to root_path, notice: notice
  end

  private

  def find_user(code)
    client = GoogleClient.new(code: code)
    return nil if client.code.nil?
    oauth_hash = client.fetch_access_token
    UserAuthentication.new(oauth_hash).auth!
  end
end
