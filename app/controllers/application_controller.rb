class ApplicationController < ActionController::Base

  # Setting the intertionalization for which is refered to values of application.rb in config
    
  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
    Mobility.locale = extract_locale|| I18n.default_locale
  end

  def extract_locale(attr = :locale)
    parsed_locale = params[attr]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale.to_sym : nil
  end
end
