class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました。" 
      user_path(current_user.id)
    else
      flash[:notice] = "ようこそ!set a goalボタンから目標を設定してみましょう。" 
      user_path  
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
