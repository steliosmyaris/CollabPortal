class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where(sender: current_user).or(Message.where(receiver: current_user)).order(created_at: :asc)
    @message = Message.new
    @users = User.where.not(id: current_user.id)
  end

def create
  @message = Message.new(message_params)
  @message.sender = current_user
  if @message.save
    NotificationChannel.broadcast_to(
      @message.receiver,
      message: "New message from #{current_user.email}: #{@message.content.truncate(50)}"
    )
    redirect_to messages_path, notice: "Message sent!"
  else
    redirect_to messages_path, alert: @message.errors.full_messages.join(", ")
  end
end

  private

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end