class AddUserIdAndAuctionIdToBids < ActiveRecord::Migration
  def change
    remove_column :bids, :user_id
    remove_column :bids, :auction_id
    add_reference :bids, :user, index: true, foreign_key: true
    add_reference :bids, :auction, index: true, foreign_key: true
  end
end
