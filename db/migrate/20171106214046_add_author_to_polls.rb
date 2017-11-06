class AddAuthorToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :author, :string
  end
end
