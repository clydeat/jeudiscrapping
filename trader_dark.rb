require 'dotenv'
require 'rubocop'
require 'pry'
require 'nokogiri'
require 'open-uri'

def trader_dark

	my_crypto_name = []
	my_super_price = []

  	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	#recupérer les noms de currencies
	my_crypto_name = doc.xpath('//*[@id="txt"]/td[2]/a')
	#récupérer la valeur en dollar
	my_super_price = doc.xpath('//*[@id="id-price"]/td[5]/a')

my_trader_hash = my_crypto_name.zip(my_super_price)

puts my_trader_hash
trader_dark.sleep(60.minutes)
	
end
trader_dark