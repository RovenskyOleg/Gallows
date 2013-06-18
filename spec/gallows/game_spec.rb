require 'spec_helper'
module Gallows
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:input) { double('input').as_null_object }
    let(:game)   { Game.new(output, input) }
    
    describe "#init" do
      it "sends array" do
        #a.new
        a[].should be_empty => a[].empty? #passes
        game.init
      end
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Gallows!')
        game.init
      end
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter the word you want to make a:')
        game.init
      end
    end

    describe "#start" do
      it "sends word" do
        game.start
        output.should_receive(:puts).with('Enter the word')
        Game.any_instance.stub(:init)
        Game.any_instance.stub(:guess)
        game.start("w")
      end
    end

    describe "#guess" do
      context "No valid number arguments" do
        xit "sends not valid > 1" do
          game.start('welcome')
          output.should_receive(:puts).with('Wrong number arguments')
          Game.any_instance.stub(:finish)
          game.guess('we')
        end
        xit "sends reduction attempts" do

        end
        xit "send tru letter" do
        end
      end
    end

    describe "#finish" do
      context "Result of the game" do 
        xit "sends Game over" do
        end
        xit "sends You win" do
        end
      
      context "sends game"
        xit "sends Play again? [y/n]" do
        end
        it "exit" do
          lambda { output.finish; exit }.should raise_error(SystemExit)  
        end
      end
    end
  end
end