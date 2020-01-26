# frozen_string_literal: true

require 'selenium-webdriver'
require_relative 'ObjectModel_SeleniumSection'
require_relative 'PuzzleSection'

require_relative 'simple_rest'
require_relative 'PuzzleSection'

#simpleRest.rb
require 'RestClient'
require 'JSON'
require 'pp'

class SeleniumSection

  #I think this is a bit hacky, but I've included the code for the rest client at the top, as I had difficulty in
  # outputing the 'Luke' 'Skywalker' values from a separate class
  # in this instance I would get the test 'working' but then speak to a Ruby developer, afterwards then do it a more elegant way
  url = 'https://swapi.co/api/people/1/'
  def import_data(url)
    string = RestClient.get(url)
    hash = JSON.parse(string)
  end
#The RestClient grabs the url and returns a string
# some JSON will parse this string into a hash
# the import_data will return the imported hash
  import_data(url)
  import_data(url).keys
  hash = import_data(url) #the above hash is saved to this variable

  name = hash.values[0]

  first_name = name.split[0]
  last_name = name.split[1]
#
#
#
  # define new browser
  browser = ObjectModel_SeleniumSection.new('https://www.seleniumeasy.com/test/input-form-demo.html')

#create a PuzzleSection Object, pass the two method values to the response variables for consumption on form entry commands
  puzzle_main = PuzzleSection.new
  puzzle_response_even = puzzle_main.return_array_puzzle_even
  puzzle_response_odd = puzzle_main.return_array_puzzle_odd


  # input value to forms.
  browser.first_name_field.send_keys(first_name) #consuming first name from PuzzleSection
  browser.last_name_field.send_keys(last_name)  #consuming first name from PuzzleSection
  browser.email_field.send_keys('test@test.com')
  browser.phoneNumber_field.send_keys('0191 285 8121')
  browser.address_field.send_keys('Testing1')
  browser.city_field.send_keys('Newcastle')
  browser.state_dropDown('Florida')
  browser.zipCode_field.send_keys('NE3 5JJ')


  browser.website_domain_field.send_keys(browser.getCurrentUrl)  #gets the current url to the websiteDomainFormField

  browser.radio_butt_no.click

#pass the even and odd numbers to the product description text field
# I found an error that I can not solve:  when passing the odd number (111) to the text field it creates a special character
# rather than spend more time, I would raise and issue for development to investigate (maybe code related) and test manually
# to attempt recreation
  browser.projectDescription_freeTextField.send_keys(puzzle_response_even)
  browser.projectDescription_freeTextField.send_keys(puzzle_response_odd)

  browser.send_button.click
  html_h2_verify =  browser.confirm_validation_text

#a simple check to see if the string input here on the test equals the string output from the H2 tag.
# thought a nice test passed or test failed message would work

  if html_h2_verify == "Input form with validations"
    puts 'Test passed'
  else
    puts 'Test failed'
  end



  # click on submit button
  # browser.state_dropDown.click
end
