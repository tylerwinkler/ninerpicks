OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '193465129625-dgprjbm2tcas870bn6ec4v0ifo05oagl.apps.googleusercontent.com', 'no6VxQ2bWZQXx9hODXP3b338', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end