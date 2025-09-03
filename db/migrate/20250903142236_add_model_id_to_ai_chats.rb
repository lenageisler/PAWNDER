class AddModelIdToAiChats < ActiveRecord::Migration[7.1]
  def change
    add_column :ai_chats, :model_id, :string
  end
end
