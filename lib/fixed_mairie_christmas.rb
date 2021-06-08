require "open-uri"
require "nokogiri"

# sytaxe https://www.youtube.com/watch?v=l8XrtVHKhCE&t
page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

# avoir touts les noms des villes en miniscule tout en remplaçant les espaces par des tirer (idée de base ajouter les noms des villes directement à l'url (fail !))
town_names = page.css("a.lientxt")

town_names_array = []

town_names.each do |za|
  town_names_array << za.text.tr(" ", "-").downcase
end

# # avoir tout les liens des villes pour pouvoir scrapper les emails
town_urls = page.xpath('//a[@class="lientxt"]/@href')
town_urls_array = []
town_urls.each do |url|
  town_urls_array.push(url.text.delete_prefix(".").prepend("https://www.annuaire-des-mairies.com"))
end

# tantative de récupére les url de town_urls_array pour les utilise avec Nokogiri(fail les array ne peuvent pas être lu avec open (piste utiliser des méthode ou une autre fonction ou gem))

email_array = [] #mettre l'array en dehors de la boucle ;)


#source de sytaxe https://www.youtube.com/watch?v=fHydl0kgkYg
town_urls_array.each do |town_urls_array|
  page_town = Nokogiri::HTML(URI.open("#{town_urls_array}"))
  email = page_town.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  email_array << email.text
end

all = Hash[town_names_array.zip(email_array)]


puts all
