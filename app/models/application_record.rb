class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_commit :store_history
	
	def versions
		ModelHistory.where(:record_id => id, :model => model_name.to_s).order(:action_time).all
	end

	def store_history
		current_user = User.current
		ModelHistory.create(
			record_id: id,
			model: model_name.to_s,
			serialized_obj: attributes.to_json,
			action_time: Time.now,
			actor_id: (defined? current_user && current_user.present?) ? current_user.id: 0,  # Zero for backend job
			action: created_at == updated_at ? "create" : "update"
		)
	end

end
