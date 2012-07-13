class Output < ActiveRecord::Base
belongs_to :user
  
  
  def self.mail
  active=Input.active_options
  active.each  do |row|
             user=User.find(row.user.id)
             message=Message.new_flights(user)#to launch mailer with outputs and user
             message.deliver
             end
  end

 
 def self.clean
  active=Input.active_options
  active.each  do |row|
             output=Output.where(:user_id=>row.user_id)
             output.each{|o| o.destroy}
             end
  end
 
 
 def self.cheaptickets
   #i=1
   active=Input.active_options
   active.each do |a|
       a.parameters do |input| 
       ticket=Cheapticket.new(input)
          if ticket.price<input[5]
          output=Output.find_or_create_by_vendor_and_start_date_and_return_date_and_departure_and_arrival_and_price_and_url_and_user_id "Cheaptickets", input[0], input[1], input[2], input[3], ticket.price, ticket.pointer, input[4]
          #puts (Time.now.to_s + " "+ i.to_s+ " " + output.price.to_s)
          #i=i+1
          end
       end
       a.touch
   end
 
 end

 def self.expedia
 #TO-DO create expedia rb.class and fill out this method
 active=Input.active_options
   active.each do |a|
       a.parameters do |input| 
       ticket=Expedia.new(input)
       if ticket.price<input[5]
          Output.find_or_create_by_vendor_and_start_date_and_return_date_and_departure_and_arrival_and_price_and_url_and_user_id "Expedia", input[0], input[1], input[2], input[3], ticket.price, ticket.pointer, input[4]
          end
       end
       a.touch
   end
 end

end
