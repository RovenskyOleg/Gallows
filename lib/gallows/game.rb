module Gallows
  class Game
    def initialize(output, input = $stdin)
      @output, @input = output, input    
    end

    def init
      @count = 6
      @a = Array.new
      @output.puts 'Welcome to Gallows!'
      @output.puts 'Enter the word you want to make a:'
    end

    def start
      init
      @output.puts 'Enter the word'
      @word = @input.gets.chomp
      loop do
        @output.puts 'Enter the letter'
        @answer = @input.gets.chomp
        guess(@answer)
      end
    end

    def finish
      if @count != 0
        @output.puts 'You win'
      else
        @output.puts 'Game over'
      end
    end

    def slovo(var)
      @array[x] = @answer
      @array.join
      if @word.length == array.length
        @output.puts array
      end      
    end

    def guess(guess)
      if guess.length != 1
        @output.puts 'Wrong number arguments'
      else
        x = @word.index(guess)
        if x == nil
          @count -= 1
        else
          @output.puts "Index your letter: #{x}"
          @a[x] = guess
          @a.join
          if @word.length == @a.length
            @output.puts @a
          #else

          end           
        end
        if @count != 0 || @word.length == @a.length
          finish
        end
      end
    end
  end
end

Gallows::Game.new(STDOUT).start