require 'rails_helper'

RSpec.describe Bag, type: :model do
	describe 'Check if there exists a name and description' do
	let(:bag) { create :bag }
	context 'validation' do
	    it "checks if there is a name" do
          expect(bag.name).not_to be_empty
      end 
 	    it "checks if there is a description" do
          expect(bag.description).not_to be_empty
        end 
	   end
	end   
end