require 'rails_helper'

RSpec.describe 'Bag API', type: :request do

describe "Retrieve list of bags(GET /bags)" do
    before { get "/bags.json" }

    context "Obtains bags (GET /index)" do
        let(:bag) { create :bag, 5 }
        it "retrieves bags, duh" do
            expect(JSON.parse(response.body)).not_to be_empty
        end
        it "return HTTP response status of 200 OK!" do
            expect(response).to have_http_status(200)
        end
    end

    context "Obtains no bags at all" do
        it "retrieves no bags, duh" do
            expect(response.body).to be_empty
            ## not working :-(
        end
    end
end

describe "Get one particular bag (GET /bags/:id)" do

    context "Obtains bag" do
        let(:bag) { create :bag }
        let(:bag_id) { bag.id }
        before { get "/bags/#{bag_id}.json" }

        it "retrieves one particular bag" do
            expect(bag).not_to be_nil
        end
        it "returns HTTP response status of 200 OK!" do
            expect(response).to have_http_status(200)
        end
    end

    context "Obtains no bag at all" do

        it "retrieves no bag" do
            get "/bags/118whatever905012.json"
            expect(JSON.parse(response.body)).to be_empty
        end
    end
end

describe "Create bag (POST /bags)" do
    let(:bag) { create :bag }
    before { post "/bags.json", bag:   { params: { name: "created name", description: "created description" } } }

    context "with valid parameters" do
        it "creates one bag" do
            post "/bags.json"
            expect(response.body).to_not be_empty
            # not working :-(
        end
    end
end

describe "Delete bag (DELETE /bags/:id)" do

    let(:bag) { create :bag }
    let(:bag_id) { bag.id }
    context "with valid parameters" do

        it "deletes one bag" do
            delete "/bags/#{bag_id}.json"
            expect(response.body).to be_empty
        end
    end
end

describe "Update bag (PATCH/PUT /bags/:id)" do
    let(:bag) { create :bag }
    let(:bag_id) { bag.id }
    context "with valid parameters" do
        it "checks if it updates" do
            patch "/bags/#{bag_id}.json", params: { name: "new name", description: "new description" }
            expect(bag.name).not_to be_empty
            byebug
        end
    end
end







# actual end hahaha don't delete =))) you always forget
end
