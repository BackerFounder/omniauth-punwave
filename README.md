# Omniauth::Backme

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem "omniauth-punwave", git: "git@github.com:BackerFounder/omniauth-punwave.git"
```

And then execute:

    $ bundle
    
## Configuration

```
# config/initializers/devise.rb
Devise.setup do |config|
  config.omniauth :punwave, Rails.application.secrets.punwave_key, Rails.application.secrets.punwave_secret
end
```
or

```
# config/initializers/devise.rb
Devise.setup do |config|
  config.omniauth :punwave, ENV["PUNWAVE_KEY"], ENV["PUNWAVE_SECRET"]
end
```

```
# app/models/user.rb
omniauth_providers: [:facebook, :google_oauth2, :weibo, :punwave]
```

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-punwave/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
