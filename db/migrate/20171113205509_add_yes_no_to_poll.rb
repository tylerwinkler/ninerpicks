class AddYesNoToPoll < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :yes_votes, :integer
    add_column :polls, :no_votes, :integer
  end
end
