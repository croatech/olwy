class Api::FavoritesController < ApplicationController

  def add
    if SwitchFavorite.call(params[:favorite_id], params[:product_id])
      render nothing: true,status: 200
    else
      render nothing: true, status: 404
    end
  end

  def delete
  end

  def count
    render text: favorites_count, status: 200
  end

  private

  def favorites_id
    "favorites_#{session[:guest_id]}"
  end

  def favorites_count
    $redis.scard favorites_id
  end

end