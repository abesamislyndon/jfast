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
  before_filter :authenticate_user!
  before_filter :set_cache_buster
  
  def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
 
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