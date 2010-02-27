# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_routy_session',
  :secret      => '699fc5813db5d21550b0032c4207d402d9188b51c1ea7c724b4b05663ee79b659fe3b871e7ac36fedc6c19bfe3190677332f8af2b79057cded8a9d44dd58e00d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
