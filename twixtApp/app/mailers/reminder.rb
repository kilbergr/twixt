class Reminder < ApplicationMailer

	def send_reminder(user)
		@user = user
		RemindersWorker.perform
	end

end