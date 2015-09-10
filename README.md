# OmniAuth Conspire

This gem contains the Conspire strategy for OmniAuth using OAuth2.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

You will have to contact Conspire for an API client id and secret. The API is currently not self serve.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-conspire'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :conspire, "CLIENT_ID", "API_SECRET",
                              :scope => 'core',
                              :rectirect_url => 'your app',
                              :provider_ignores_state => true
end
```

If you are using the strategy with devise you can configure it like this:

```ruby
Devise.setup do |config|
  config.omniauth :conspire, "client_id", "secret",
                              :scope => 'core',
                              :rectirect_url => 'my_app_callback',
                              :provider_ignores_state => true
end
```

Note that you must set provider_ignores_state for Conspire or you will see a CSRF error.

## Refreshing your access token

Conspire tokens expire after 60 minutes. You will need to refresh tokens manually. You can do so in your application with the following code.

```ruby
url       = URI("https://www.conspire.com/oauth2/token")
response  = Net::HTTP.post_form(url,
              { 'refresh_token' => refresh_token, #stored from original authorization
                'client_id' => CONSPIRE_CLIENT_ID,
                'client_secret' => CONSPIRE_SECRET,
                'grant_type' => 'refresh_token'}
            )
data      = JSON.parse(response.body)
```

## License

This code is gifted to the public domain.
