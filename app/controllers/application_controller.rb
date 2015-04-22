class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def authenticate_admin_user!
  authenticate_user!
    unless current_user.admin?
    flash[:alert] = "This area is restricted to administrators only."
    redirect_to root_path
  end
 end

def current_admin_user
  return nil if user_signed_in? && !current_user.admin?
  current_user
end

def after_sign_in_path_for(resource)
if current_user.admin?
	authenticated_root_path
else
    login_index_path
end
end

end