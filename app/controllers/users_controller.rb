class UsersController < Clearance::UsersController
  def new
    @google_auth_path = GoogleClient.new.auth_url
    super
  end
end
