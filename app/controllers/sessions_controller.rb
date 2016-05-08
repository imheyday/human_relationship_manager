class SessionsController < Clearance::SessionsController
  def new
    @google_auth_path = GoogleClient.new.auth_url
  end

  def auth_with_google
    client = GoogleClient.new(code: request['code'])
    @oauth_hash = client.fetch_access_token if client.code.present?
    user = UserAuthentication.new(@oauth_hash).auth!
    if user
      sign_in(user)
      notice = t('success.messages.google_auth')
    else
      notice = t('error.messages.google_auth')
    end
    redirect_to root_path, notice: notice
  end
end
