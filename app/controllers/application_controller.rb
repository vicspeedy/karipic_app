class ApplicationController < ActionController::Base
    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to publications_path, notice: "You are not authorized to perform this action"
        end
    end
end
