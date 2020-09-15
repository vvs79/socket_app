class ChatsController < ApplicationController
  before_action :_get_chats, only: [:index, :show, :edit, :update]

  def index
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(permitted_parameters)

    if @chat.save
      flash[:success] = "Chat #{@chat.name} was created successfully"
      redirect_to chat_path(@chat)
    else
      render :new
    end
  end

  def edit
    return redirect_to chats_path unless @chat
  end

  def update
    return redirect_to chats_path unless @chat

    if @chat.update_attributes(permitted_parameters)
      flash[:success] = "Chat #{@chat.name} was updated successfully"
      redirect_to chat_path(@chat)
    else
      render :new
    end
  end

  def show
    return redirect_to chats_path unless @chat

    @chat_message = ChatMessage.new(chat: @chat)
    @chat_messages = @chat.chat_messages.includes(:user)
  end

  private

  def _get_chats
    @chats = Chat.all
    @chat  = Chat.find_by(id: params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:chat).permit(:name)
  end
end
