# OmniAuth Passport

This gem contains the Everyday Hero Passport strategy for OmniAuth.

## Experimental

This gem will only work if you have a copy of our OAuth2 server running locally on http://passport.edh.dev which probably isn't you. Once we sought out the URL structure I will make a 1.0.0 release.

## How To Use It

Usage is as per any other OmniAuth 2.0 strategy. Add the strategy to your `Gemfile`:

    gem 'omniauth-passport', '~> 0.0.1'

After adding the gem you will need to `bundle install` and create `config/initializers/omniauth.rb`.

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :passport, ENV['PASSPORT_KEY'], ENV['PASSPORT_SECRET']
    end

The typical convention for key / secret pairs is storing them in an environment variable. Lots of tools (e.g. POW and Procfile) will source an environment file before loading which is a great place to put the environment variables.

Currently we are returning the users `name`, `email` and `uid`.

For more information on hooking up omniauth checkout the README at: https://github.com/intridea/omniauth
