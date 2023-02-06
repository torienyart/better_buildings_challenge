class Sector < ApplicationRecord
  has_many :partners

  def self.order_by_created
    Sector.all.order(created_at: :desc)
  end

  def partner_count
    partners.count
  end
end