class AddQuestionToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :question, :text
  end
end
