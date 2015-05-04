#filename: dice_app.rb
require "./dice"
include Dice

#Displays instructions.
puts <<-EOP

Let's play STREET DICE!

Here are the rules:
If you roll a 7 or 11 on the first roll, you win.

If you roll a 2, 3 or 12 on the first roll, you lose.

If you roll any other number, you must roll that number 
again to win before you roll a 7 and crap out.

Before we begin, how old are you?
EOP

#Allows user to input age.
#Must be 21 or older to load game and play.
user_age = gets.chomp.to_i

if user_age >= 21 
  load_game
else
  puts "\nYou are too young to play. Come back when you're older."
end