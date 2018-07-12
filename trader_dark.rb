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

trader_dark

def get_cryptocurrency_rate
i=0
    while i<3
        doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        array_des_cours = []
        doc.css('a[class = price]').each{ |taux| array_des_cours<< taux.text}

        array_des_monnaies = []
        doc.css('a[class = link-secondary]').each{ |monnaie| array_des_monnaies<< monnaie.text}

        hash_des_cours = Hash[array_des_monnaies.zip(array_des_cours)]
        p hash_des_cours    

        i = i+1
        sleep 3600 # attend 1h (3600 secondes) avant de redémarrer la boucle
    end

end

get_cryptocurrency_rate