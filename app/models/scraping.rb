# require 'net/http'
# require 'uri'
# require 'rexml/document'



# class Scraping
#   def self.parse(start_num)
#     uri = URI.parse("http://webservice.recruit.co.jp/ab-road/city/v1/?key=5900068d2833119a&format=json&start=#{start_num}&count=100")
#     json = Net::HTTP.get(uri)
#     result = JSON.parse(json)
#     original = result["results"]["city"]
#   end

#   def self.getdata(original,start_num)
#     city = original.map{|item| item["name"]}
#     city_code = original.map{|item| item["code"]}
#     country = original.map{|item| item["country"]}.map{|item| item["name"]}
#     country_code = original.map{|item| item["country"]}.map{|item| item["code"]}
#     area = original.map{|item| item["area"]}.map{|item| item["name"]}
#     area_code = original.map{|item| item["area"]}.map{|item| item["code"]}
#     tour_count = original.map{|item| item["tour_count"]}
#     for i in 1..100 do
#       search = Search.where(city: city[i], city_code: city_code[i], country: country[i], country_code: country_code[i], area: area[i], area_code: area_code[i], tour_count: tour_count[i]).first_or_initialize
#       search.save
#     end
#   end

#   def self.loop
#     start_num = 0
#     for j in 1..15 do
#      puts 1
#        original = Scraping.parse(start_num)
#        Scraping.getdata(original,start_num)
#      start_num += 100
#     end
#   end
# end
