class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.reserve_price
      @auction.current_price = @auction.reserve_price
    else
      @auction.current_price = 0
    end
    @auction.user = current_user
    if @auction.save
      flash[:notice] = "Auction Created Successfully"
      redirect_to auction_path(@auction)
    else
      flash[:alert] = "Failed to create new auction item."
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new
  end


  private

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price, :current_price)
  end
end
