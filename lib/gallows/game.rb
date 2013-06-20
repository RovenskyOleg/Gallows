module Gallows
  class Game
    def initialize(output, input = $stdin)
      @output, @input = output, input    
    end

    def init
      @count = 6
      @a = Array.new    #храниет угаданные буквы слова
      @output.puts 'Welcome to Gallows!'
      @output.puts 'Enter the word you want to make a:'
    end

    def start
      init
      stty_settings = %x[stty -g]
      @output.puts 'Enter the word'
      begin
        %x[stty -echo]
        @word = gets.chomp
      ensure
        %x[stty #{stty_settings}]
      end
      str = "*"*@word.length
      puts "length word: #{str}"
      loop do
        @output.puts 'Enter the letter'
        @answer = @input.gets.chomp
        guess(@answer)
      end
    end

    def finish
      if @count == 0
        @output.puts 'Game over'
      else
        @output.puts "Answer: #{@a}"
        @output.puts 'You win'
      end
      @output.puts "Play again? [y/n]"
      if (gets.chomp == "y")
        @output.puts start
      else
        exit
      end
    end

    def guess(guess)
      if guess.length != 1
        @output.puts 'Wrong number arguments'
      else
        x = @word.index(guess) #индекс угаданной буквы
        if x == nil
          @count -= 1
          @output.puts "You have tru: #{@count}"
        else
          @a[x] = guess
          y = @word.rindex(guess) #индекс угаданной буквы
          if y != x
            @a[y] = guess
          end
        end
        @output.puts "To guess the letter: #{@a}"
      end 
      if @count == 0
        finish
      else
        if @a.count(nil) == 0
          if @word.length == @a.length
            finish
          end
        end
      end
    end
  end
end

Gallows::Game.new(STDOUT).start