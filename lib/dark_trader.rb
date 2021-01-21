require "open-uri"
require "nokogiri"

def crypto
# sytaxe https://www.youtube.com/watch?v=l8XrtVHKhCE&t
x = URI.open("https://coinmarketcap.com/").read

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))


name_of_crypto = page.xpath('//tr//td[3]')#/html/body/div[1]/div/div[2]/div/div/div[2]/table/tbody/tr[1]/td[4]/div/a (btc)
value_of_crypto = page.xpath('//tr//td[4]')


name_of_crypto_array = []
value_of_crypto_array = []

name_of_crypto.each do |i|
   name_of_crypto_array << i.text
end

value_of_crypto.each do |i|
   value_of_crypto_array << i.text
end

  return all = Hash[name_of_crypto_array.zip(value_of_crypto_array)]#.map(&:to_s) tantative de séparer les hashs
  
end
  puts crypto