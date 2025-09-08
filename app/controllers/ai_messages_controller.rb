class AiMessagesController < ApplicationController

  SYSTEM_PROMPT = <<~PROMPT
    "Your are a Pet Adoption Consultant.\n\n
    I am looking to adopt a dog from a shelter, but I'm not sure what type of dog would be best for my personal situation.\n\n
    Your task is to help me decide what preferences I should set when choosing a dog that fits my livestyle and living conditions.
    Suggest personality traits, behavior characteristics, and other qualities that would make a dog that will suit me best.
    Ask follow up questions guiding me to define the relevent criteria matching the preferences table
    (no field in the table is required; please use the text inside the strings inside the collection arrays for referencing those values;
    only refer to boolean true as selected; humanize the table column names).\n\n
    Provide clear and consice advice and answer concisely in Markdown"
  PROMPT

  PREFERENCE_SCHEMA = <<~SCHEMA
    "Table Preferences\n\n - age_min, integer\n\n - age_max, integer\n\n - gender, collection: ["male", „female“]\n\n - neutered, boolean\n\n
    - breed_grade, collection: ["Pure breed", "Hybrid", „Mix“]\n\n - breed_category, collection: ["Shepherd-type", "Herding-type", "Retriever-type",
    "Poudle-type", "Big gentle", "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type", "Small & fluffy",
    "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed“]\n\n
    - main_breed, string (disclaimer: not encouraged to use, because of difficult matching)\n\n
    - shoulder_height_min, integer\n\n - shoulder_height_max, integer\n\n - weight_min, float\n\n - weight_max, float\n\n
    - location, collection: ["Shelter", "Foster Care", „Overseas"]\n\n - health_issus, boolean\n\n - restricted_breed, boolean\n\n
    - beginner_friendly, boolean\n\n - male_compatible, collection: [„yes"]\n\n - female_compatible, collection: [„yes"]\n\n - cat_compatible, collection: [„yes"]\n\n
    - kids_compatible, collection: [„yes"]\n\n - ideal_environment, collection: ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"]"
  SCHEMA

  def new
    @ai_chat = AiChat.find(params[:ai_chat_id])
    @ai_message = AiMessage.new
  end

  def create
    @ai_chat = AiChat.find(params[:ai_chat_id])
    @ai_message = AiMessage.new(ai_message_params.merge(role: "user", ai_chat: @ai_chat))
    if @ai_message.valid?
      @ai_chat.with_instructions(instructions).ask(@ai_message.content) do |chunk|
        next if chunk.content.blank?
        message = @ai_chat.messages.last
        message.content += chunk.content
        broadcast_replace(message)
      end
      broadcast_replace(@ai_chat.messages.last)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to ai_chat_path(@ai_chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_ai_message",
          partial: "ai_messages/form", locals: { chat: @ai_chat, message: @ai_message})}
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

  def preferences_structure
    "Here is the structure of the preference table: #{PREFERENCE_SCHEMA}"
  end

  def instructions
    [SYSTEM_PROMPT, preferences_structure].compact.join("\n\n")
  end
end
