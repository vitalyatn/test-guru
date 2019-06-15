class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
