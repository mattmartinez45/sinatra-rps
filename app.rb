require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
end


get("/rock") do
  move = rand(1..3)
  result = ""
  finality = ""
	if move == 1
    result = "rock"
  elsif move == 2
    result = "paper"
  elsif move == 3
    result = "scissors"
  end

  if result == "rock"
    finality = "tied"
  elsif result == "paper"
    finality = "lost"
  elsif result == "scissors"
    finality = "won"
  end

	
	@ourmove = "We played rock!"
  @theirmove = "They played #{result}!"
  @outcome =  "We #{finality}!"

  erb(:rock_setup)
  
end

get("/paper") do
  move = rand(1..3)
  result = ""
  finality = ""
	if move == 1
    result = "rock"
  elsif move == 2
    result = "paper"
  elsif move == 3
    result = "scissors"
  end

  if result == "rock"
    finality = "won"
  elsif result == "paper"
    finality = "tied"
  elsif result == "scissors"
    finality = "lost"
  end

	
	@ourmove = "We played paper!"
  @theirmove = "They played #{result}!"
  @outcome =  "We #{finality}!"
	
	erb(:paper_setup)
end

get("/scissors") do
  move = rand(1..3)
  result = ""
  finality = ""
	if move == 1
    result = "rock"
  elsif move == 2
    result = "paper"
  elsif move == 3
    result = "scissors"
  end

  if result == "rock"
    finality = "lost"
  elsif result == "paper"
    finality = "won"
  elsif result == "scissors"
    finality = "tied"
  end

	
	@ourmove = "We played scissors!"
  @theirmove = "They played #{result}!"
  @outcome =  "We #{finality}!"
	
	erb(:scissors_setup)
end
