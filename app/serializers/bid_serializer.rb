class BidSerializer < ActiveModel::Serializer
  attributes :id, :amount, :auction_id, :user_id, :creation_date

  def creation_date
    object.created_at.strftime("%Y-%b-%d")
  end
end
