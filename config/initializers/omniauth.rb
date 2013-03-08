OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '406838246076549', 'd0d814a42122b8d0fbde45e10be0ac25'
end