Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fatsecret, '8ae71955d01b4f85ad39e05c633dd91b', '67a075ec7e174283888966452a13ed46'
end