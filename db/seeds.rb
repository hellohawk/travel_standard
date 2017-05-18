# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

# likes_csv = CSV.readlines("db/likes.csv")
# likes_csv.shift
#   likes_csv.each do |row|
#     Like.create(user_id: row[3], upload_id: row[4])
#   end

searches_csv = CSV.readlines("db/searches.csv")
searches_csv.shift



  searches_csv.each do |row|
     Search.create(upload_id: row[1], country_name: row[4], city_name: row[5], conti_name: row[6], subconti_name: row[7], country: row[8], city: row[9], continent: row[10], subcontinent: row[11])
   end