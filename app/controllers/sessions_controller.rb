class SessionsController < Devise::SessionsController
	protected

	def after_sign_out_path_for(resource_or_scope)
 	respond_to?(:root_path) ? root_path : "/"
	end
end