# frozen_string_literal: true
# Author:  Graeme Phillips
# Date: 26/01/2020
# Summary:- Tried to follow a page Object Model but abstracting the page objects to one class, to be accessed by SeleniumSection.rb
# No Test are here, initialisation present
# I know this isn't the most elegant of coding 

require 'selenium-webdriver'
require 'page-object'

class ObjectModel_SeleniumSection

  include PageObject  # include the PageObject class for Ruby

  def initialize(url)  # function to instantiate a browser Selenium driver instance


    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to url
    sleep(2)  # insert a sleep as previously selenium crashed without this and intermitent failier to maximize late
    @driver.manage.window.maximize
    sleep(2)

    end

  
  # start of methods to map page objects
  def getCurrentUrl
    @driver.current_url
  end

  def first_name_field
    @driver.find_element(:name, 'first_name')
  end

  def last_name_field
    @driver.find_element(:name, 'last_name')
  end

  def email_field
    @driver.find_element(:name, 'email')
  end

  def phoneNumber_field
    @driver.find_element(:name, 'phone')
  end

  def address_field
    @driver.find_element(:name, 'address')
  end

  def city_field
    @driver.find_element(:name, 'city')
  end

  def state_dropDown(city)  # for this I had to pass values - this was tricky to find out!!
    # Select the dropdown button
    dropdown_list = @driver.find_element(:name, 'state')

    # Get all the options from the dropdown
    options = dropdown_list.find_elements(tag_name: 'option')

    # Find the dropdown value by text
    options.each { |option| option.click if option.text == city }
  end

  def zipCode_field
    @driver.find_element(:name, 'zip')
  end

  def website_domain_field
    @driver.find_element(:name, 'website')
  end

  def radio_butt_yes
    browser.radio(:value,"A gem").set
  end

  
  # went for use of xpath here, typically I wouldn't hard code, but pass into a String for ease of use and test suite maintenance
  def projectDescription_freeTextField
    @driver.find_element(:xpath,'/html/body/div[2]/div/div[2]/section/form/fieldset/div[11]/div/div/textarea')
  end

  def radio_butt_yes
    @driver.find.element(:xpath, '/html/body/div[2]/div/div[2]/section/form/fieldset/div[10]/div/div[1]/label/input')
  end

  def radio_butt_no
    @driver.find_element(:xpath, '/html/body/div[2]/div/div[2]/section/form/fieldset/div[10]/div/div[2]/label/input')
  end
  def send_button
    @driver.find_element(:xpath, '/html/body/div[2]/div/div[2]/section/form/fieldset/div[13]/div/button')
  end

  def confirm_validation_text
    val_text = @driver.find_element(:xpath, '/html/body/div[2]/div/div[2]/h2').text()
    val_text

  end



end