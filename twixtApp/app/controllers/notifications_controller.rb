class NotificationsController < ApplicationController
	before_action :find_item

	def create
		@notification = @item.notification.new(notification_params)
    @notification.save
    redirect_to list_items_path(@list)
	end

	private
		def notification_params
	    params.require(:notification).permit(:message, :phone, :send_by, :recemail, :item_id)
	  end

	  def find_item
	    @item = Item.find_by_id(params[:item_id])
	  end
end
