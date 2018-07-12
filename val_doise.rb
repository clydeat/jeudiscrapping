require 'dotenv'
require 'rubocop'
require 'pry'
require 'nokogiri'
require 'open-uri'


# #OBTENIR L'ADRESSE EMAIL DE VAUREAL
def get_the_email_of_a_townhal_from_its_webpage
doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	email = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	puts email
end
get_the_email_of_a_townhal_from_its_webpage

#OBTENIR TOUTES LES URL DE VILLES DU VAL D'OISE
def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	puts doc.xpath('//a[@class = "lientxt"]/@href')
end
get_all_the_urls_of_val_doise_townhalls

def get_all_the_urls_of_val_doise_townhalls

my_super_name_of_town = []
my_super_emails = []

	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	link_to_check = doc.xpath('//a[@class = "lientxt"]/@href')
	#ça me donne tous les a, qui sont les noms de villes et url de ville

	#indiquer de rentrer dans chaque url de ville ?????????
	link_to_check.each do |one_link|
	
		# i_need_to_check_page(one_link)
		
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{one_link}"))
		
		my_super_name_of_town = doc.xpath('//body/div/main/section[1]/div/div/div/h1')
		#cette ligne me recupère les noms de ville

		my_super_emails = doc.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
		#cette ligne me récupere les emails

		my_super_hash = my_super_name_of_town.zip(my_super_emails)

		puts my_super_hash
	end
end
get_all_the_urls_of_val_doise_townhalls





