class BidsController < ApplicationController

  before_action :authenticate_user, only: [:create]

  def index
    @bids = current_user.bids
  end

  def create
  @auction = Auction.find(params[:auction_id])
  @bid = Bid.new bid_params
  @bid.auction = @auction
  @bid.user = current_user
  if @bid.amount > @auction.current_price
    @bid.save
    @auction.update(current_price: @bid.amount)
    redirect_to auction_path(@auction), notice: "Bid recorded!"
  else
    if @bid.amount < @auction.current_price
      flash[:alert] = "Bid not recorded. Bid amount to low."
      render "auctions/show"
    else
      flash[:alert] = "Bid not recorded. Reserve Price not met!"
      render "auctions/show"
    end
  end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

end
