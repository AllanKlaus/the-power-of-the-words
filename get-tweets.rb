require 'twitter'
require 'yaml'

# Alterar para chaves reais que funcione
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "ylrsqTXOAsPOVFhWacTTnZMQJy"
  config.consumer_secret     = "fOYX2URJoVaYZDtuMgOUR32VazFH3OA8NhXsUNVBqSA29afqdo7"
  config.access_token        = "859421564-r74PDYCDfYaQ4dPKiOGI6K3EqVp2HeoV64Jk9PCuT"
  config.access_token_secret = "rduoTIft8pZ7wQV2xC7kNnoukg8dF58hxjgmmIcPJW6ao7"
end


# Palavras chaves da busca no twitter, darão o nome do arquivo de retorno
search = 'haddad educação'
tweets = client.search(search, result_type: "recent", count: 100, tweet_mode: 'extended').take(10_000)
File.write("#{search}.yml", YAML.dump(tweets))
puts "Acabou #{search}"