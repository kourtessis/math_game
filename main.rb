require "./player"
require "./question"

player1 = Player.new
player2 = Player.new

player = 1
count = 0

# start game with P1 and P2 at 3 lives, P1 goes first

until player1.lives == 0 && player2.lives == 0
  if player == 1
    if count != 0
      puts '***** NEW TURN *****'
    end
    question = Question.new
    puts "player 1: #{question.question}"
    print ">>"
    answer = gets.chomp.to_i
    if answer == question.answer
      puts 'P1: Well done!'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      player = 2
      count +=1
    else
      player1.lives -=1
      puts 'P1: Try Again'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      if player1.lives == 0
        break
      end
      player = 2
      count +=1
    end

  end



end 
