QB_KEY = "qyprdKviVoz38xm0bFs4JAl0mzrDpF"
QB_SECRET = "owJmMEj9nDsi0EtPhObP85L2TbvMOSSB8PGu6q8J"

Quickbooks.sandbox_mode = true

$qb_oauth_consumer = OAuth::Consumer.new(QB_KEY, QB_SECRET, {
  :site                 => "https://oauth.intuit.com",
  :request_token_path   => "/oauth/v1/get_request_token",
  :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
  :access_token_path    => "/oauth/v1/get_access_token"
})
