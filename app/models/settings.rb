module Settings
  extend self

  def admin_name = get :admin_name
  def admin_password = get :admin_password

  def slack_invite_url = get :slack_invite_url

  private

  class MissingError < StandardError
    def initialize(name) = super("Credential #{name} or environment variable #{name.to_s.upcase} is missing")
  end

  def get(name)
    ENV.fetch name.to_s.upcase do
      Rails.application.credentials.fetch name do
        return if ENV["SETTINGS_OPTIONAL"] == "1"

        raise MissingError, name
      end
    end
  end
end

