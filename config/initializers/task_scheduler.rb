scheduler = Rufus::Scheduler.start_new
 
 scheduler.every("5m") do
 Output.cheaptickets
 end
  
 
 scheduler.every("12h") do
 Output.mail
 end
  
 scheduler.every("24h") do
 Output.clean
 end
 
 
