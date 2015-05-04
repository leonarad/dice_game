#filename: dice.rb
module Dice

  #Rolls two dice and shows outcome of roll.
  def roll
    @dice1 = rand(1..6)
    @dice2 = rand(1..6)
    @total_roll = @dice1 + @dice2
    @roll_num += 1
    puts "Dice 1: #{@dice1}"
    puts "Dice 2: #{@dice2}"
    puts "Your Roll #{@roll_num}: #{@total_roll}"
  end

  #If user wins, adds the bet to user's total money and diplays new total money.
  def win_point
    @total_money += @new_player_bet
    puts "\nYou won."
    puts "Your Money: $#{@total_money}"
    ask_bet

  end

  #Allows user to enter bet and proceed to first roll or exit game.  
  #Will not allow user to bet more money than they have.
  def ask_bet
    if @total_money == 0
      exit_game
    else
      puts "\nDo you want to bet?"
      puts "If so, type the amount you would like to bet.  If not, type exit."
      @new_player_bet = user_input
      while @new_player_bet > @total_money 
        puts "\nYou cannot bet that amount. You have $#{@total_money}. How much do you want to bet?"
        @new_player_bet = user_input
      end 
    first_roll
    end
  end

  #Gets user input and requires user input to be an integer.
  def user_input
    input = gets.chomp
    if input.downcase == "exit"
      exit_game
    elsif input.to_i <= 0
      puts "You cannot bet that amount or say that. Try again."
      ask_bet unless @total_money.nil?
      load_game
    else
      input.to_i
    end
  end

  #Exits game and displays total money.
  def exit_game
    puts "\nThanks for playing! You have $#{@total_money}."
    exit
  end

  #Defines first roll.
  #If first roll is a 7 or 11, user wins.
  #If first roll is a 2, 3 or 12, user loses.
  #If first roll is any other number (4, 5, 6, 8, 9 or 10), that number is saved (the "dice_point") and proceeds to next roll. 
  def first_roll
    @roll_num = 0
    roll
    @points = 0
    if @total_roll == 7 || @total_roll == 11
      win_point
    elsif @total_roll == 2 || @total_roll == 3 || @total_roll == 12
      player_lose
    else
      @dice_point = @total_roll
      puts "To get a point, roll #{@dice_point} again.  Press enter to continue."
      enter_to_continue
    end
  end

  #To win, user must roll the dice_point again.
  #If the user rolls a 7, user craps out and loses their bet.
  def next_roll
    roll
    crap_out = 7

    if @total_roll == @dice_point 
      win_point
    elsif @total_roll == crap_out  
      player_lose
    else
      puts "Roll again.  Press the enter to continue"
      enter_to_continue
    end
  end

  #Helps control flow of program.  
  #Allows user press enter to roll dice.
  def enter_to_continue
    press_enter = gets
    unless press_enter == "\n"
      "Invalid entry.  Press enter."
      press_enter = gets
    end
      next_roll
  end

  #If user loses, subtracts the bet to user's total money and diplays new total money.
  def player_lose
    @total_money -= @new_player_bet
    puts "\nYou lose."
    puts "Your Money: $#{@total_money}"
    ask_bet
  end

  #Loads the game and allows user to set how much money they have to play with to start.
  def load_game
    puts "\nHow much money do you have to play?"
    @total_money = user_input
    ask_bet
  end
end