class Message < ActionMailer::Base
  default from: "from@example.com"

   def new_flights (user)
     #@outputs = user.outputs
     @outputs = Output.where(:user_id=>user.id).order("price ASC").limit(5)
     puts @outputs.inspect
     mail(:to => user.email,
     :subject => "Flights updates") do |format|
             format.text
             format.html
             end
   end
end
