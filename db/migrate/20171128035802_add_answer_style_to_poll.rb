class AddAnswerStyleToPoll < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :answer_style, :boolean
  end
end
