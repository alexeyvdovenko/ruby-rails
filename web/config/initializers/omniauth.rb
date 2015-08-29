Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '487420274756558', 'c1019adc58a546ae6b97595eb2d3c47e',
  :scope => 'email'
end
