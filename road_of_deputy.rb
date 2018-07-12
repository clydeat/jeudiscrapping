require 'dotenv'
require 'rubocop'
require 'pry'
require 'nokogiri'
require 'open-uri'

def road_of_deputy
	first_name = []
	last_name = []
	emails_deputy = []
	all_first_and_last_name = []
	
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	link_deputy_to_check = doc.xpath('//ul[@class="col3"]//a/@href')

	link_deputy_to_check.each do |one_link|

	#recupérer le first name et last name
	#all_first_and_last_name = doc.xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[2]/a')
	# all_first_and_last_name.text
	#last_name = first_name[2]
	#recuperer le link de chaque depute
	#indiquer de rentrer dans chaque url de ville ?????????


		doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/#{one_link}"))
		emails_deputy << doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a')
		all_first_and_last_name = doc.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1')
		all_first_and_last_name = all_first_and_last_name.to_s.delete_prefix("<h1>")
		all_first_and_last_name = all_first_and_last_name.to_s.delete_prefix("M.")
		all_first_and_last_name = all_first_and_last_name.to_s.delete_prefix("Mme")
		all_first_and_last_name = all_first_and_last_name.to_s.delete_suffix("</h1>")
		

		# J'AI 
		all_first_and_last_name = all_first_and_last_name.split(" ")

		first_name = all_first_and_last_name.drop(1)
		last_name = all_first_and_last_name.drop_while{|i| i>1}
		# puts all_first_and_last_name
		puts las

		my_deputy_hash_with_beautiful_name = first_name.zip(last_name)
		my_final_hash_of_asshole = my_deputy_hash_with_beautiful_name.zip(emails_deputy)


	# puts my_final_hash_of_asshole
	end
end
road_of_deputy

