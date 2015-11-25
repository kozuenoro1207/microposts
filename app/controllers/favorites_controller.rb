class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @micropost = Micropost.find(favorite_params[:micropost_id])
        current_user.favoriting(@micropost)
    end

    def destroy
        @micropost = current_user.favorite_relationships.find(params[:id]).micropost
        current_user.unfavorite(@micropost)
    end
    
    def favorite_params
        params.fetch(:favorite, {}).permit(:user_id, :micropost_id)
    end
end