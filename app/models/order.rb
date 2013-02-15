class Order < ActiveRecord::Base
  paginates_per 10
  attr_accessible :card_expires_on, :card_number, :card_verification, 
                  :card_name, :card_type, :cart_id, :first_name, :ip_adress,
                  :last_name, :express_token

  belongs_to :cart  
  has_many :line_items

  def total_commision
    #(self.cart.line_items.to_a.sum(&:rate)).sum
    (self.cart.line_items.to_a.sum(&:rate)).sum
  end

  scope :in_progress, where("orders.checked_out_at IS NULL")
  scope :complete, where("orders.checked_out_at IS NOT NULL")

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def self.find_with_product(product)
    return [] unless product
    complete.includes(:line_items).
      where(["line_items.product_id = ?", product.id]).
      order("orders.checked_out_at DESC")
  end

  def checkout!
    self.checked_out_at = Time.now
    self.save
  end

  def recalculate_price!
    self.total_price = line_items.inject(0.0){|sum, line_item| sum += line_item.price }
    save!
  end

  def state
    checked_out_at.nil? ? IN_PROGRESS : COMPLETE
  end

  def display_name
    ActionController::Base.helpers.number_to_currency(total_price) + 
     " - Order ##{id} (#{user.username})"
  end



end 
