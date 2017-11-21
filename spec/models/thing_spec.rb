require 'rails_helper'

RSpec.describe Thing, type: :model do
	describe 'Check if there exists a name' do
	let(:bag) { create :bag } 
	let(:thing) { create :thing, bag: bag }
		context 'validation' do
		    it "checks if there is a name" do
	          expect(thing.name).not_to be_empty
	    	end 
		end
	end   
end