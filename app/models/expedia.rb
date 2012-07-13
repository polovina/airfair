class Expedia
  #require 'nokogiri'
  require 'open-uri'
 
 def initialize(parameters)
         @parameters=parameters
         @pointer=""
 end
 
 def url
   departure=@parameters[2]
   arrival=@parameters[3]
   start_date=@parameters[0] #format XX/XX/XXXX
   return_date=@parameters[1]
   start_date=CGI.escape(start_date)
   return_date=CGI.escape(return_date)
   query="trip=roundtrip&leg1=from:#{departure},to:#{arrival},departure:#{start_date}TANYT&leg2=from:#{arrival},to:#{departure},departure:#{return_date}TANYT&passengers=children:0,adults:1,seniors:0,infantinlap:Y&options=cabinclass:coach,nopenalty:N,sortby:price&mode=search"
   return "http://www.expedia.com/Flights-Search?"+query
 end
 
 def price
    
    #doc = Nokogiri::HTML(open(url))
    #f = File.open("public/url2.txt")
    #doc = Nokogiri::HTML(f)
    #f.close
    #parameters=['10/12/2012', '12/10/2012', 'SVO', 'LAX']
    #begin
          min_price=@parameters[5].to_i
          url=self.url
          doc = Nokogiri::HTML(open(url))
          doc.xpath('//*[@id="type3TotalPrice0"]')
          #node = doc.xpath('//div[@id="type3TotalPrice0"]')
          doc.xpath('//div[@class="priceDisplayingVariationOff xp-flt-mdlfr-bspr"]').each do |node|
          puts node.text
          price=node.text.strip
          price.slice!(0)
          price=price.to_i
          if price<min_price
               min_price=price
               @pointer=url
               end
          end
    #rescue
    #end
    
 return min_price.to_i
 end
 
 end
