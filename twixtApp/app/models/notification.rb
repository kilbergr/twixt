class Notification < ActiveRecord::Base

	def self.find_notifications_to_send
		#find by send_by time
		Notification.where('send_by >= DateTime.now').where('send_by <= ((DateTime.now.to_time + 5.hours).to_datetime)')
		
		#if current time <= send_by and within range where range is send_by - scan interval to send_by
		#i.e. current time is 10:00 AM send_by is 11:00 PM and scan interval is 3 hours, range is 8:00 PM - 11:00 PM
		#if in range push whole notification record/obj to ready_to_send array
		#return array
	end

	def send_text_notification
		#if ready_to_send array has elements, array.each for twilio POST 
		#from array get notification.phone, notification.id, and notification.message (if it exists)
		#if no .message, default to standard message with find_by item.id and get item.name
	end

	def send_email_notification
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

end
