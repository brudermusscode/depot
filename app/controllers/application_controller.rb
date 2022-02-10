class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params

  # filter unwanted parameters from list when devise_controller is active
  before_action :configure_permitted_parameters, if: :devise_controller?

  def self.default_url_options
    { locale: I18n.locale }
  end

  protected

  # params that should pass sign up and editing users with devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
          "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
