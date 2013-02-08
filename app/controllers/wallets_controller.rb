class WalletsController < ApplicationController
  def show
    @wallet = Wallet.find_all_by_user_id(current_user)
logger.info"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+@wallet.inspect
  end
end
