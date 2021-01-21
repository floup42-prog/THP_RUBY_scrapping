require "open-uri"
require "nokogiri"


# x = URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html").read

# sytaxe https://www.youtube.com/watch?v=l8XrtVHKhCE&t
page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))


town_names = page.css('a.lientxt')

town_names_array = []

 town_names.each do |za|
   town_names_array << za.text.tr(" ", "-").downcase
end

# puts tab

# # Get array of all city websites
town_urls = page.xpath('//a[@class="lientxt"]/@href')
town_urls_array = []
town_urls.each do |url|
town_urls_array.push(url.text.delete_prefix('.').prepend('https://www.annuaire-des-mairies.com'))
  end


  x = town_urls_array[2]
puts  x.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
