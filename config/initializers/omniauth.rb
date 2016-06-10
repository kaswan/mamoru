Rails.application.config.middleware.use OmniAuth::Builder do 
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
    
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
              {
                :scope => 'email, public_profile', 
                :info_fields => 'id,name,email,gender,link'
              }
              
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],    
              {
                :name => "google",
                :scope => "email, profile",        
                :image_aspect_ratio => "square",
                :image_size => 50
              }
        
  provider :yahoojp, ENV['YAHOOJP_KEY'], ENV['YAHOOJP_SECRET'],  
            {
              :scope => "openid email profile address",
              :state => "broz1101U9DYjRrN2VrTyZzU9DYjRrN2VrTyZzPP",
              :nonce => "broz00U9DYjRrN2VU9DYjRrN2VrTyZzPU9DYjRrN",
              :display => 'popup',
              :windowWidth  => "500",
              :windowHeight => "400"
            }
end