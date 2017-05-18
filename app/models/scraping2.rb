require 'net/http'
require 'uri'
require 'rexml/document'
require 'pry'


kouhos = ['Japan','China','India','SriLanka','Indonesia','Cambodia','Thailand','Philippines','Uzbekistan','Turkey','UnitedKingdomofGreatBritainandNorthernIreland','Netherlands','Belgium','Australia','Fiji','NewZealand','Solomon Islands','PapuaNewGuinea','Canada','Mexico','Argentina','Ecuador','Colombia','Chile','Paraguay','Brazil','Peru','Uganda','Kenya','Algeria','Egypt','Tunisia','Morocco','Zimbabwe','SouthAfrica','Swaziland','France','Switzerland','Austria','Germany','Hungary','Poland','Italy','Spain','Portugal','Sweden']

kouhos.each do |kouho|

  a = Search.where(country_name:kouho).pluck(:city_name,:country_name,:subconti_name,:conti_name,:city,:country,:subcontinent,:continent)

  if a.length < 50 then
    c = a
  else
    c = a[1..50]
  end

  c.each do |b|
    city_name = b[0]
    country_name = b[1]
    city = b[4]
    country = b[5]
    subcontinent = b[6]
    continent = b[7]
    uri = URI.parse("https://www.google.co.jp/search?q=#{country_name}+#{city_name}+photos+tripadviser&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjay-Sy2vfTAhWFTbwKHU-lAy0Q_AUICigB&biw=1399&bih=780")
    doc = Nokogiri::HTML.parse(open(uri))
    for j in 1..4 do
      img = doc.css('img')[j].attributes["src"].value
      upload = Upload.new(continent:continent, subcontinent:continent, country:country, city:city,user_id:1)
      upload.remote_image_url = img
      upload.save!
    end
  end

end





