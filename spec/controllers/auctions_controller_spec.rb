require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      # This mimics sending a get request to the new action
      get :new
      # response is an object that is given to us by RSpec that will help test
      # things like redirect / render
      # render_template is an RSpec (rspec-rails) matcher that helps us check
      # if the controller renders the template with the given name.
      expect(response).to render_template(:new)
    end

    it "instantiates a new Auction object and set it to @auction" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do

      context "with valid attributes" do
        def valid_request
          post :create, auction:{title: "some valid title",
            details: "some valid description",
            end_date: 60.days.from_now
          }
        end

        it "creates a record in the database" do
          auction_count_before = Auction.count
          valid_request
          auction_count_after = Auction.count
          expect(auction_count_after - auction_count_before).to eq(1)
        end
      end

      context "with invalid attributes" do

        def invalid_request
          post :create, auction:{title: "some valid name",
            details: nil,
            end_date: 60.days.from_now
          }
        end

        it "doesn't create a record in the database" do
          auction_count_before = Auction.count
          invalid_request
          auction_count_after = Auction.count
          expect(auction_count_before).to eq(auction_count_after)
        end
    end
  end
end
