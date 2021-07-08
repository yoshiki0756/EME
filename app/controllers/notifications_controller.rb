class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path(current_user), notice: "通知をすべて削除しました。"
  end
end
