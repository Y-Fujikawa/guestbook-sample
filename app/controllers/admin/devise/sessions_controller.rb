class Admin::Devise::SessionsController < Devise::SessionsController
  layout "admin/layouts/login"

  # Admin画面のログイン -> Adminホーム画面へリダイレクト
  def after_sign_in_path_for(resource)
    admin_path
  end

  # Admin画面のログアウト -> ログイン画面へリダイレクト
  def after_sign_out_path_for(resource)
    admin_admin_user_session_path
  end
end
