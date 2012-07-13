# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Input.create("start_date"=>"06/30/2012", "return_date"=>"07/05/2012", "departure"=>"SFO", "arrival"=>"LAX", "active"=>true, "user_id"=>1, "threshold"=>1000)
