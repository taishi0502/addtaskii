class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :alllevelup, only: [:sign_up]
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def alllevelup
    @user = User.new
    level = @user.increment(:level, 1)
    level.save
  end
end
