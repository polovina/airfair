class Cheapticket
  require 'open-uri'
 
 def initialize(parameters)
         @parameters=parameters
         @pointer=""
 end
 
 def pointer
   @pointer
 end
 
 def url
   departure_temp=@parameters[2]
   arrival_temp=@parameters[3]
   start_date_temp=@parameters[0][0..5]+@parameters[0][8..9]
   return_date_temp=@parameters[1][0..5]+@parameters[1][8..9]
   start_date_temp=CGI.escape(start_date_temp)
   return_date_temp=CGI.escape(return_date_temp)
   query="type=air&ar.type=roundTrip&ar.rt.leaveSlice.orig.key=#{departure_temp}&ar.rt.leaveSlice.originRadius=80.0+mi&_ar.rt.leaveSlice.originRadius=0&ar.rt.leaveSlice.dest.key=#{arrival_temp}&ar.rt.leaveSlice.destinationRadius=80.0+mi&_ar.rt.leaveSlice.destinationRadius=0&ar.rt.leaveSlice.date=#{start_date_temp}&ar.rt.leaveSlice.time=Anytime&ar.rt.returnSlice.date=#{return_date_temp}&ar.rt.returnSlice.time=Anytime&ar.rt.flexAirSearch=true&_ar.rt.flexAirSearch=0&ar.rt.numAdult=1&ar.rt.numSenior=0&ar.rt.numChild=0&ar.rt.child%5B0%5D=&ar.rt.child%5B1%5D=&ar.rt.child%5B2%5D=&ar.rt.child%5B3%5D=&ar.rt.child%5B4%5D=&ar.rt.child%5B5%5D=&ar.rt.child%5B6%5D=&ar.rt.child%5B7%5D=&_ar.rt.nonStop=0&_ar.rt.narrowSel=0&ar.rt.narrow=airlines&ar.rt.carriers%5B0%5D=&ar.rt.carriers%5B1%5D=&ar.rt.carriers%5B2%5D=&ar.rt.cabin=C&search=Search+Flights"
   return "http://www.cheaptickets.com/shop/home?"+query
 end

 def price
    
    #creating stub for testing
    #f = File.open("public/url.txt")
    #doc = Nokogiri::HTML(f)
    #f.close
    min_price=@parameters[5].to_i
          begin
          doc = Nokogiri::HTML(open(self.url))
          doc.xpath('//a[@class="mainPrice link"]').each do |node|
          price=node.text.strip
          price.slice!(0)
          price=price.to_i
          if price<min_price
               min_price=price
               @pointer=node['href']
               end
         end
         rescue
         end 
    return min_price.to_i
  end

end
