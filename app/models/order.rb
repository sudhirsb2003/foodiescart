class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_name, :card_type, :cart_id, :first_name, :ip_adress, :last_name

  validate :validate_card, :on => :create
  
  def purchase
    response = ActiveMerchant::Billing::TrustCommerceGateway.new(
            :login => 'TestMerchant',
            :password => 'password')

  end
  
    

  def price_in_cents
    (cart.total_price*100).round
  end

  private
  
  def purchase_options
    {
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  def credit_card
 @credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => 'Bob',
                :last_name          => 'Bobsen',
                :number             => '4242424242424242',
                :month              => '8',
                :year               => Time.now.year+1,
                :verification_value => '000')
end


end
