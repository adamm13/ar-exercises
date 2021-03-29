class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :carry_mens_or_womans

  def carry_mens_or_womans
    if mens_apparel != true && womens_apparel != true
      errors.add(:apparal_error, "Store must carry mens or womens clothing")
    end
  end
end