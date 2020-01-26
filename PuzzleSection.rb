#Author:  Graeme Phillips
# Date: 26/01/2020

require 'rspec'
require_relative 'ObjectModel_SeleniumSection'

#method to get all odd numbers from an array - may not be the best way,
def get_odd_numbers(array)
  oddArray = array
  oddSelection =  oddArray.select(&:odd?)
  oddSelection
end

#method to get all even numbers from an array
def get_even_numbers(array)
  evenArray = array
  evenSelection =  evenArray.select(&:even?)
  evenSelection
end

class PuzzleSection

  def return_array_puzzle_even

    #the array given in the test requirements
  even = get_even_numbers([60, 33, 1719, 25, 19, 13, -21])
  return even

  end
  #the array given in the test requirements
  def return_array_puzzle_odd
    odd = get_odd_numbers([22, 24, 0, 100, 4, 111, 2602, 18])
    return odd
  end

end






