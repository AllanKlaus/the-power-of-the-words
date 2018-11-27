require 'twitter'
require 'yaml'

search = 'bolsonaro_seguranca_violencia'
# search = 'haddad_seguranca_violencia'
file = "#{search}.yml"
tweets = YAML.load_file(file)

tweets_filtereds = []

# Salvar como YAML
# tweets.each do |tweet|
#   tweet.attrs[:full_text].delete!("\n")
#   tweets_filtereds << tweet.attrs[:full_text] || 'nil' unless tweet.attrs[:full_text].include?('...')
# end
# File.write("treated_#{search}.txt", tweets_filtereds.uniq)

# Salvar como TXT
file = File.open("treated_data/treated_#{search}.txt", "w")
tweets.each do |tweet|
  tweet.attrs[:full_text].delete!("\n")
  tweets_filtereds << tweet.attrs[:full_text] unless tweet.attrs[:full_text].include?('...') && tweet.attrs[:full_text].nil?
end

file.write(tweets_filtereds.join("\n"))

