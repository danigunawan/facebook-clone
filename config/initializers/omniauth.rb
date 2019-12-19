Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '472372953684327', '104dad17b3f4baf23de7f0050c189ba7',
  # scope: 'email, first_name, last_name', display: 'popup'
  scope: 'email', info_fields: 'email, name'
end