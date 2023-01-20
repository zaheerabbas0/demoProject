module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', "User #{current_user.id}"
    end

    protected

    def find_verified_user
      (current_user = env['warden'].user) ? current_user : reject_unauthorized_connection
    end

    def app_cookies_key
      Rails.application.config.session_options[:key] ||
        raise("No session cookies key in config")
    end
  end
end