# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sifu_session',
  :secret      => '0710b3e8e8ed8daf86ae5cfc8cdbd37d57697273e1968348af1b51fe1700a62daf37110ee5dc91b80c462dee8728e864fd24625482ae20de4ba196da1db1e6ad'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
