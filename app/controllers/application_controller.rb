class ApplicationController < ActionController::Base

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Admin画面のログイン -> Adminホーム画面へリダイレクト
  def after_sign_in_path_for(resource)
    admin_path
  end

  # Admin画面のログアウト -> ログイン画面へリダイレクト
  def after_sign_out_path_for(resource)
    admin_user_session_path
  end
end
