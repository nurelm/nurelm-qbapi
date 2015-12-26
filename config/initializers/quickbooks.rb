# Your Intuit app's API creds. Remember that you can only use development
# keys with development sandbox accounts, and that you have to go to
# production mode in order to test against a real QB account.
QB_CONSUMER_KEY = ENV['QB_CONSUMER_KEY']
QB_CONSUMER_SECRET = ENV['QB_CONSUMER_SECRET']

if ENV['RAILS_ENV'] != 'production'
  Quickbooks.sandbox_mode = true
end

$qb_oauth_consumer = OAuth::Consumer.new(QB_CONSUMER_KEY, QB_CONSUMER_SECRET, {
  :site                 => 'https://oauth.intuit.com',
  :request_token_path   => '/oauth/v1/get_request_token',
  :authorize_url        => 'https://appcenter.intuit.com/Connect/Begin',
  :access_token_path    => '/oauth/v1/get_access_token'
})
