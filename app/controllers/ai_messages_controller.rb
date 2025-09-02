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
    if @ai_message.save
      @response = RubyLLM.chat.with_instructions(SYSTEM_PROMPT).ask(@ai_message.content)
      AiMessage.create(role: "assistant", content: @response.content, ai_chat: @ai_chat)
      redirect_to ai_chat_path(@ai_chat)
    else
      render 'ai_chats/show', status: :unprocessable_entity
    end
  end

  private

  def ai_message_params
    params.require(:ai_message).permit(:content)
  end
end
