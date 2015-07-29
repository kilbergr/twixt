class RemindersWorker
	include Sidekiq::Worker 

	def perform(item_id)
		reminder = Item.find_by_id (item_id)
		

	end 
end