class Input < ActiveRecord::Base
belongs_to :user


 def self.active_options
  options=Input.where(:active=>true)
  #options=Input.where("(updated_at + interval*60*600) < ?", Time.now)
  options.delete_if{|row| (Time.now-row.updated_at) < row.interval.hours}
  return options
 end

 def parameters
  self.start_date.split(",").each do |start_date| 
		         self.return_date.split(",").each do |return_date| 
				          self.departure.split(",").each do |departure|
				                self.arrival.split(",").each do |arrival|
						                    yield [start_date, return_date, departure, arrival, self.user_id, self.threshold] #if date1<date2
                        end
                  end
             end
  end
  return self
 end

end
