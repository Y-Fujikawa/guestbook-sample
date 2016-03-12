class Admin::Devise::RegistrationsController < Devise::RegistrationsController
  layout "admin/layouts/login"

  # Admin画面のログイン -> Adminホーム画面へリダイレクト
  def after_sign_in_path_for(resource)
    admin_path
  end
end
