class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to new_user_path
  end

end
