class AddTitleToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :title, :string
  end
end
