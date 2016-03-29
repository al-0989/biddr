class BidsController < ApplicationController

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

  # def destroy
  #   pledge = current_user.pledges.find params[:id]
  #   campaign = Campaign.find(params[:campaign_id])
  #   pledge.destroy
  #   redirect_to campaign
  # end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

end
