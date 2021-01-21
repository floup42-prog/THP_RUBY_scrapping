require "open-uri"
require "nokogiri"

x = URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html").read

# sytaxe https://www.youtube.com/watch?v=l8XrtVHKhCE&t
ressource = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))


puts mail = ressource.css('a.lientxt')

tab = []

mail.each do |za|
   tab << za.text.tr(" ", "-").downcase
end

array1 = []

tab.each do |i|

   doc = URI.open("https://www.annuaire-des-mairies.com/95/#{tab}.html").read

   simple = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/#{tab}.html"))

   y = simple.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
   puts array1 << i.text

end