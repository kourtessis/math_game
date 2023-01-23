require "./player"
require "./question"


player1 = Player.new
player2 = Player.new

player = 1
count = 0

# Start off the game with Both players being alive and 1st player turn
until player1.lives == 0 && player2.lives == 0
  if player == 1
    if count !=0 
      puts '** NEW TURN **'
    end
    question = Question.new
    puts "P1: #{question.question}"
    print "Enter Answer>"
    answer = gets.chomp.to_i
  if answer == question.answer
    puts 'P1: Well done!'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      player = 2
      count +=1
    else
      player1.lives -=1
      puts 'P1: Whomp whomp, try again!'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      if player1.lives == 0
        break
      end
      player = 2
      count +=1
    end

  end

  if player == 2
    if count != 0
      puts '** NEW TURN **'
    end
question = Question.new
    puts "P2: #{question.question}"
    print "Enter Answer>"
    answer = gets.chomp.to_i
    if answer == question.answer
      puts 'P2: Well done!'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      player = 1
      count +=1
    else
      player2.lives -=1
      puts 'P2: Whomp whomp, try again'
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      if player2.lives == 0
        break
      end
      player = 1
      count +=1
    end
  end
end


if (player1.lives == 0)
  puts "Player 2 wins! #{player2.lives}/3"
  puts '** GAME OVER **'
end
if(player2.lives == 0)
  puts "Player 1 wins! #{player1.lives}/3"
  puts '** GAME OVER **'

end