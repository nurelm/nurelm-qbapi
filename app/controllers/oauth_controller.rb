class OauthController < ActionController::Base

  def index
    @base_url = oauth_authenticate_url
  end

  def authenticate
    callback = oauth_callback_url
    token = $qb_oauth_consumer.get_request_token(:oauth_callback => callback)
    session[:qb_request_token] = Marshal.dump(token)
    redirect_to("https://appcenter.intuit.com/Connect/Begin?oauth_token=#{token.token}") and return
  end

  def callback
      access_token =
        Marshal.load(session[:qb_request_token]).
        get_access_token(:oauth_verifier => params[:oauth_verifier])
      token = access_token.token
      secret = access_token.secret
      realm_id = params['realmId']
      # store the token, secret & RealmID somewhere for this user, you will need all 3 to work with Quickbooks-Ruby

      @token = token
      @secret = secret
      @realm_id = realm_id
  end

end
