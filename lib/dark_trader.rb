require "open-uri"
require "nokogiri"

# sytaxe https://www.youtube.com/watch?v=l8XrtVHKhCE&t
x = URI.open("https://coinmarketcap.com/").read

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))


name_of_crypto = page.xpath('//tr//td[3]')#/html/body/div[1]/div/div[2]/div/div/div[2]/table/tbody/tr[1]/td[4]/div/a (btc)
value_of_crypto = page.xpath('//tr//td[4]')


tab = []
tab2 = []

name_of_crypto.each do |za|
   tab << za.text
end

value_of_crypto.each do |za|
     tab2 << za.text
end

  les2= Hash[tab.zip(tab2)]

  puts les2