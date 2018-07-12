require 'dotenv'
require 'rubocop'
require 'pry'
require 'nokogiri'
require 'open-uri'

# def trader_dark

# 	my_crypto_name = []
# 	my_super_price = []

#   	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
# 	#recupérer les noms de currencies
# 	my_crypto_name = doc.xpath('//*[@id="txt"]/td[2]/a')
# 	#récupérer la valeur en dollar
# 	my_super_price = doc.xpath('//*[@id="id-price"]/td[5]/a')

# my_trader_hash = my_crypto_name.zip(my_super_price)

# puts my_trader_hash
# trader_dark.sleep(60.minutes)
	
# end

# trader_dark

def trader_dark
i=0
    while i<3
        doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        my_super_price = []
        doc.css('a[class = price]').each{ |taux| my_super_price<< taux.text}

        my_crypto_name = []
        doc.css('a[class = link-secondary]').each{ |monnaie| my_crypto_name<< monnaie.text}

        my_trader_hash = Hash[my_crypto_name.zip(my_super_price)]
        p my_trader_hash    

        i = i+1
        sleep 3600 # attend 1h (3600 secondes) avant de redémarrer la boucle
    end

end

trader_dark