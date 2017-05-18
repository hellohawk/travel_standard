# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

likes_csv = CSV.readlines("db/likes.csv")
likes_csv.shift
  likes_csv.each do |row|
    Like.create(user_id: row[3], upload_id: row[4])
  end