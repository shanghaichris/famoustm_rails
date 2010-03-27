# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_famoustm_rails_session',
  :secret => 'c6827607f9e550feea5211465ab6359d82908330226e9d304768a75bbfdb803d3055c470db1df473d2dbecc67cbffda37b0cb221196fe7e959b7811cc4b8bcf7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
