#simpleRest.rb
require 'RestClient'
require 'JSON'
require 'pp'

url = 'https://swapi.co/api/people/1/'
def import_data(url)
  string = RestClient.get(url)
  hash = JSON.parse(string)
end
#RestClient grabs the url and returns a string
#JSON will parse this string into a hash
#import_data will return the imported hash
import_data(url)
#This is the returned hash:


import_data(url).keys
hash = import_data(url) #the above hash is saved to this variable

name = hash.values[0]

first_name = name.split[0]
last_name = name.split[1]


