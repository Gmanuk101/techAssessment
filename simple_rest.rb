#Author:  Graeme Phillips
# Date: 26/01/2020
# created a simple rest client to grab json values and store in variable for later consumption
# I started with this file on it's own, then could not find out how to pass from this to another file.
# a strange effect occured, when this code was placed (and is duplicated in) into SeleniumSection.rb it works
# however If I do not reference THIS file from SeleniumSection.rb AND have the duplicated code it work, else it doesn't.
# very strange indeed and I couldn't figure out why - sorry.

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
