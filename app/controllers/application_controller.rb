class ApplicationController < ActionController::Base
  around_action :set_locale

  def set_locale(&action)
    ## If locale is invalid it fallback to default locale
    locale =  I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def handle_404
    redirect_to root_path
  end
end
