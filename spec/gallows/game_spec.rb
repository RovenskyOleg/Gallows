require 'spec_helper'
module Gallows
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:input) { double('input').as_null_object }
    let(:game)   { Game.new(output, input) }
    
    describe "#init" do
      it "check array" do
        a = []
        a.should be_empty 
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

    describe "#guess" do
      before(:each) do
        game.init
        game.instance_variable_set(:@a, "a")
        game.instance_variable_set(:@word, "a")
      end

      context "No valid number arguments" do
        before(:each) { output.should_receive(:puts).with("Wrong number arguments") }
        it "is too short" do
          game.guess("")
        end
        it "is too long" do
          game.guess("wi")
        end
      end
      before(:each) do
        game.init
        game.instance_variable_set(:@x, "")
      end
      it "sends reduction attempts" do
        x = nil
        x.should be_nil
      end
      it "sends tru letter" do
        x = '1'
        x.should_not be_nil
      end
    end

    describe "#finish" do
      context "Result of the game" do 
        it "Game over when counter = 0" do
          count = 0
          count.should be_zero
        end
        it "You win" do
          count = 1
          a = "letter"
          word = "letter"
          count.should_not be_zero 
          word.should == a
        end
        it "Exit Game" do
          lambda { output.finish; exit }.should raise_error(SystemExit)  
        end
      end
    end
  end
end