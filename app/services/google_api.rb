class GoogleApi

  attr_reader :access_token

  def initialize(token)
    @access_token = token
  end

  def userinfo
    get('/userinfo')
  end

  private

  def host
    'https://www.googleapis.com/oauth2/'
  end

  def version
    'v1'
  end

  def full_url(endpoint)
    "#{host}#{version}#{endpoint}"
  end

  def get(endpoint)
    response = HTTParty.get(full_url(endpoint), query: { alt: 'json', access_token: @access_token })
    JSON.parse(response.body)
  end
end
