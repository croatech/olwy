class SubscriptionsController < ApplicationController

  def create
    if CreateSubscription.new(params[:email]).call
      redirect_to :back
      flash[:success] = 'Вы подписались на новости.'
    else
      redirect_to :back
      flash[:danger] = 'Произошла ошибка. Возможно, вы уже подписаны.'
    end
  end

  def remove
    # subscriptions/remove?key=1asldkjlas
    if params[:key] && RemoveSubscription.new(params[:key]).call
      redirect_to root_path
      flash[:success] = 'Вы успешно отписались от рассылки.'
    else
      redirect_to root_path
      flash[:danger] = 'Произошла ошибка. Возможно, вы не подписаны.'
    end
  end

end
