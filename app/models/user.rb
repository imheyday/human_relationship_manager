class User < ActiveRecord::Base
  include Clearance::User

  has_many :authentications

  def self.create_with_password(params)
    password = generate_password
    params.merge!(password: password)
    User.create(params)
  end

  def self.generate_password
    rand(32**16).to_s(32)
  end
end
