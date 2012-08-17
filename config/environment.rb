# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BidPal::Application.initialize!

 ActionMailer::Base.delivery_method = :smtp
 ActionMailer::Base.default_url_options = {
 :host => '10.77.111.64:3000'
 }
 ActionMailer::Base.perform_deliveries = true
 ActionMailer::Base.smtp_settings = {
 :enable_starttls_auto => true,
 :address              => "mail.persistent.co.in",
 :port                 => "587",
 :domain               => 'persistent.co.in',
 :user_name            => 'ammar_nasikwala@persistent.co.in',
 :password             => 'doll52)(',
 :authentication       => 'login',
 :enable_starttls_auto => true
 }