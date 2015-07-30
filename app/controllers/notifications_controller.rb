class NotificationsController < ApplicationController
	before_action :find_item

	def create
		notification_params[:phone].slice!("-")
		notification_params[:phone].slice!("-")
	
		#EXTRACT DATA FROM PARAMS TO FORMAT BEFORE IT GOES IN TO DB (format phone number and figure out how to turn send_by in to real numbers)
		@notification = Notification.new(notification_params)
    @notification.save
 	end

	private
		def notification_params
	    params.require(:notification).permit(:message, :phone, :send_by, :recemail, :item_id, :list_id, :item_name)
	  end

	  def find_item
	    @item = Item.find_by_id(params[:item_id])
	  end


end
