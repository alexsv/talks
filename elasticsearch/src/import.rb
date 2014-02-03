require 'yaml'
require 'tire'

cars = YAML::load(File.open("cars.yml"))["cars"]

total = 0

Tire.index "cars" do
  delete 
  create
  cars.each do |car_type, models| 
    models.each do |id, obj|
      obj.merge!({
        "id" => id,
        "text" => "#{obj['year']} #{obj['manufacturer']} #{obj['model']} #{car_type.capitalize}",
        "type" => car_type
      })
      store obj
      total += 1
    end
  end
end

puts "Imported #{total} records"