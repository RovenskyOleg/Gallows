require 'spec_helper'
module Gallows
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:input) { double('input').as_null_object }
    let(:game)   { Game.new(output, input) }
    
    describe "#init" do
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
      context "No valid number arguments" do
        xit "sends not valid > 1" do
       
        end
      end
    end



  end
end
