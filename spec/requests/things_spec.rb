require 'rails_helper'

RSpec.describe 'Thing API', type: :request do

	describe "Retrieve list of things(GET /things)" do

    let(:bag) { create :bag }
    let(:bag_id)  { bag.id }
    let(:thing) { create_list(:thing, 5, bag: bag) }

	before { get "/bags/#{bag_id}/things.json" }

	context "Obtains things from that bag" do

		it "retrieves things, duh" do
			3.times do 
				create :thing, bag: bag
			end
			expect(bag.things).not_to be_empty
		end

		it "return HTTP response status of 200 OK!" do
			expect(response).to have_http_status(200)
		end

	end

	context "Obtains no things at all" do

		it "retrieves no things, duh" do 
			expect(bag.things).to be_empty
		end

		it "return HTTP response status of 200 OK!" do
			expect(response).to have_http_status(200)
		end

	end

	end
	
end