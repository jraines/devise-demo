class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, omniauth_providers: [:github]

  def self.find_for_github_oauth(auth)
    #when we slice auth we get:
    #{:provider => 'github', :uid => 'some_uid'}

    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.email = auth[:info][:email]
      user.token = auth[:credentials][:token]
      user.password = Devise.friendly_token[0,20]
    end
  end

end
