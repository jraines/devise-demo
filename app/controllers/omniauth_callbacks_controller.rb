class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_for_github_oauth(user_params)

    flash[:notice] = "Welcome! #{@user.email}"
    sign_in(@user)
    redirect_to root_path
  end

  private

  def user_params
    p = ActionController::Parameters.new(request.env["omniauth.auth"])

    p.permit(:provider, :uid, {info: [:email, :nickname]},
             {credentials: [:token]})
  end
end
