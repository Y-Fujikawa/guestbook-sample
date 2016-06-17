class Admin::Devise::SessionsController < Devise::SessionsController
  layout "admin/layouts/login"

	after_action :delete_flash, only: [:create]

  # Admin画面のログイン -> Adminホーム画面へリダイレクト
  def after_sign_in_path_for(resource)
    admin_path
  end

  # Admin画面のログアウト -> ログイン画面へリダイレクト
  def after_sign_out_path_for(resource)
    admin_user_session_path
	end

	def delete_flash
    if flash[:notice].present?
      flash.discard(:notice)
    end
	end
end
