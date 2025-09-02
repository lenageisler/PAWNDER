class AddColumnsToAiMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :ai_messages, :model_id, :string
    add_column :ai_messages, :input_tokens, :integer
    add_column :ai_messages, :output_tokens, :integer
    add_reference :ai_messages, :tool_call, foreign_key: true
  end
end
