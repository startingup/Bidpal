
#setting enviroment

ENV['RAILS_ENV'] ||= 'production'

#require File.dirname(__FILE__) + "/../../config/environment"
# Load the rails application
require File.expand_path('../application', __FILE__)
require 'active_support/dependencies'

# Initialize the rails application
BidPal::Application.initialize!

 ActionMailer::Base.delivery_method = :smtp
 ActionMailer::Base.default_url_options = {
 :host => 'localhost:3000'
 #:host => "bidpal.herokuapp.com"
 }
 ActionMailer::Base.perform_deliveries = true
 ActionMailer::Base.smtp_settings = {
 :enable_starttls_auto => true,
 :address => "mail.persistent.co.in",
 :port => 587,
 :domain               => 'persistent.co.in',
 :user_name            => 'ammar_nasikwala@persistent.co.in',
 :password             => 'incontrol123+',
 :authentication       => 'login',
 :enable_starttls_auto => true
 }