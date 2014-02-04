require 'yaml'
require 'tire'
require 'faker'

Tire.configure do 
  url "http://192.168.60.11:9200"
end

n = 10000

Tire.index "test_index" do
  delete 
  create
  (1..n).each do |i| 
    obj = {
      id: i,
      fullname: Faker::Name.name,
      city: Faker::Address.city,
      description: Faker::Lorem.paragraph
    }
    store obj
  end
end

puts "#{n} records were added"

