# ==========================================================================
# ==== MODEL METHODS TO HANDLE FINDING NOTIFICATIONS DUE TO BE =============
# ====    SENT OUT, SENDING THEM, AND REMOVING FROM DB         =============
# ==========================================================================

class Notification < ActiveRecord::Base
	require 'twilio-ruby'

	def self.find_notifications_to_send
		notifications_to_send = Notification.where('send_by < ?', DateTime.now.utc)
	end

	def self.send_text_notification(array)
		account_sid = 'ACd0509cb02417c4a459614b40d29e284d' 
		auth_token = '59cc552aeb9030fe64cf99ee3bf80cbb'
		client = Twilio::REST::Client.new account_sid, auth_token  
		unless array.length == 0
			array.each do |notification|
				if notification.message == nil
					client.account.messages.create({
						:from => '+14154814661', 
						:to => '+1' + notification.phone, 
						:body => "Twixt App is contacting you to remind you about #{notification.item_id}",  
					})	
				else
					client.account.messages.create({
						:from => '+14154814661', 
						:to => '+1' + notification.phone, 
						:body => "Twixt App is contacting you to remind you about #{notification.message}",  
					})	
				end
			end	
		end	
	end

	def self.send_email_notification(array)
		unless array.length == 0
			array.each do |notification|
				if notification.message == nil
					mail(from: @email,
					to: @friend,
					subject: "A reminder from #{user.first_name}",
					)
				else
					
		#if ready_to_send array has elements, array.each for email
		#from array get notification.recemail, notification.id, and notification.message (if it exists)
		#if no .message, default to standard message with find_by item.id and get item.name
	end

	def send_notification_to_group
		# if ready_to_send array has elements, array.each 
		# item= Item.find_by_id(notification.id)
		# list = item.list
		# group = list.group
		# recipients = group.users

		# if user has phone, send_text_notification
		# else send_email_notification
	end

	def self.purge_old_notifications(array)
		array.each do |notification|
			delete_this = Notification.find_by_id(notification.id)
			delete_this.destroy
		end
	end

end
