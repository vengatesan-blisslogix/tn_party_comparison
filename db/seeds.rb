# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


file = CSV.foreach("/data/tn_dist.csv", headers:true) do |row|

#@find_dist = DistrictList.find_by_name("#{row[2].strip}")
puts"--qqqq----#{row[0].strip}----#{row[1].strip}---"
@dist = DistrictList.new
@dist.name = row[1].strip
@dist.save 

end


file = CSV.foreach("/data/tn.csv", headers:true) do |row|

@find_dist = DistrictList.find_by_name("#{row[2].strip}")
puts"--qqqq----#{row[0].strip}----#{row[1].strip}--#{@find_dist.id}--"
@area = Area.new
@area.name = row[1].strip
@area.district_list_id = @find_dist.id
@area.save

end
