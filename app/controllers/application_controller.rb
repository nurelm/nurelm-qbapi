class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :verify_env

  private

  def verify_env
    if ENV['QB_CONSUMER_KEY'].blank? ||
       ENV['QB_CONSUMER_SECRET'].blank? ||
       ENV['SECRET_KEY_BASE'].blank?
       raise "Must set QB_CONSUMER_KEY, QB_CONSUMER_SECRET, and " +
             "SECRET_KEY_BASE environment variables."
    end
  end
end
