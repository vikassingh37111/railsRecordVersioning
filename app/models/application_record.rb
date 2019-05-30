class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

	after_commit :store_history
	
	def get_history
		ModelHistory.where(:record_id => id, :model => model_name.to_s).all
	end

	def store_history
		ModelHistory.create(
			record_id: id,
			model: model_name.to_s,
			serialized_obj: attributes.to_json,
			action_time: Time.now,
			actor_id: (defined? current_user) ? current_user : 0,  # Zero for backend job
			action: created_at == updated_at ? "create" : "update"
		)
	end

end
