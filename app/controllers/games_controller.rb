require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @letters
  end


  def english_word?(word)
  url = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(url.read)
  json['found']
  end

  def score
    if english_word?(params[:suggestion])
      @true = "congratulations"
    else
      @true = "sorry your #{params[:suggestion]} is not in the english dictionary"
    end
  end
end


# require 'open-uri'
# require 'json'






# def generate_message(word_in_grid, word_exist)
#   if word_exist
#     word_in_grid ? message = "Well Done!" : message = "not in the grid"
#   elsif word_in_grid && !word_exist
#     message = "not an english word"
#   else
#     message = "Your word doesn’t exist, and doesn’t respect the grid of letters."
#   end
#   message
# end

# def run_game(attempt, grid, start_time, end_time)
#   word_exist = api(attempt)["found"]
#   word_in_grid = check_word(attempt, grid)
#   time = end_time - start_time
#   score = word_exist && word_in_grid ? api(attempt)["length"] / time * 100 : 0
#   message = generate_message(word_in_grid, word_exist)
#   { time: time, score: score, message: message }
# end
