require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoList
  class Application < Rails::Application
    # helper_method :current_user
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.


    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_user
      redirect_to '/login' unless current_user
    end

  end
end
