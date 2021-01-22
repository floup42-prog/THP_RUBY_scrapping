=begin
Décomposons le programme en 2 sous-problèmes simples:
Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout 
l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.
=end

require "nokogiri"
require "open-uri"

  # Méthode qui prend les url et les emails
def get_townhall_urls_and_emails(name)

  town_href = name["href"].delete_prefix "."
  # Prend le href des liens de toutes les villes, enlève le prefix " . " pour faire fonctionner comme il faut l'url
  
  town_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{town_href}"))
  # Ouvre les url des villes grâce au href

  emails = town_url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text #.text : https://stackoverflow.com/questions/2505104/html-to-plain-text-with-ruby
  # Va chercher les emails des villes sur les différentes pages
  
end

def emails_hashing # mettre les emails dans un hash
  site = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html")) # lien du site à scrapper dans cette variable 
  tables = site.css('[@class="lientxt"]') # tables = site.css nokogiri pour scrapper le code html où sont stockés les noms
  tables.map { |name| { name.text => get_townhall_urls_and_emails(name) } } 
  
=begin
  tables.map prend tous les noms, le paramètre "name" me permet de récupérer le nom dans le code html appelé dans la variable tables 
  name.text et la key dans le hash & get_townhall_urls_and_emails(name) rappelle ma méthode pour chercher les mails qui seront stockées 
  dans le hash en tant que value
=end
end

#juste des puts
puts emails_hashing
puts "Il y a #{emails_hashing.length} emails"