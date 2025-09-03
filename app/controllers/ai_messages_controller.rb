class AiMessagesController < ApplicationController

  SYSTEM_PROMPT = "Your are a Pet Adoption Consultant.\n\nI am looking
  to adopt a dog from a shelter, but I'm not sure what type of dog would be best
  for my personal situation.\n\nYour task is to help me decide what preferences
  I should I set when choosing a dog thats fits my livestyle and living conditions.
  Suggest personality traits, behavior characteristics, and other qualities that
  would make a dog that will suit me best.\n\n Provide clear and consice advice,
  and format your answer in markdown"

  def new
    @ai_chat = AiChat.find(params[:ai_chat_id])
    @ai_message = AiMessage.new
  end

  def create
    @ai_chat = AiChat.find(params[:ai_chat_id])
    @ai_message = AiMessage.new(ai_message_params.merge(role: "user", ai_chat: @ai_chat))
    if @ai_message.valid? # With ToolCall there's no need to save the message
      @ai_chat.with_instructions(SYSTEM_PROMPT).ask(@ai_message.content) do |chunk|
        next if chunk.content.blank? # skip empty chunks
        # shows assistance response by chunks
        message = @ai_chat.messages.last
        message.content += chunk.content
        broadcast_replace(message)
      end
      broadcast_replace(@ai_chat.ai_messages.last)  # solves a broadcast bug
      respond_to do |format|
        format.turbo_stream # renders `app/views/ai_messages/create.turbo_stream.erb`
        format.html { redirect_to ai_chat_path(@ai_chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message",
          partial: "ai_messages/form", locals: { ai_chat: @ai_chat, ai_message: @ai_message})}
        format.html { render 'ai_chats/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def broadcast_replace(message)
    Turbo::StreamsChannel.broadcast_replace_to(@ai_chat, target:
    helpers.dom_id(message), partial: "ai_messages/message",
    locals: { message: message })
  end

  def ai_message_params
    params.require(:ai_message).permit(:content)
  end
end
