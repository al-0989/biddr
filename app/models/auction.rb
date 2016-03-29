class Auction < ActiveRecord::Base

  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true, uniqueness: true
  validates :end_date, presence: true

end
