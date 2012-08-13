#class MyMailer < ActionMailer::Base
  #default from: "ammar_nasikwala@persistent.co.in"
  
   # def	welcome_email(user)
	#@user = user
	#@url  = "http://localhost:3000/user"
    #mail(:from => "dupinder_bains@persistent.co.in", :to => user.email, :subject => "Welcome to My Awesome Site", :cc => "dupinder_bains@persistent.co.in")
	#end
#end

class MyMailer < Devise::Mailer
  def headers_for(action)
    headers = {
      :subject       => translate(devise_mapping, action),
      :from          => mailer_sender(devise_mapping),
      :to            => resource.email,
      :cc            => "ammar_nasikwala@persistent.co.in",
      :template_path => template_paths
    }
  end
end

