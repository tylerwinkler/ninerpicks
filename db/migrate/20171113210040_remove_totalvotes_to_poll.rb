class RemoveTotalvotesToPoll < ActiveRecord::Migration[5.1]
  def change
    remove_column :polls, :totalvotes
  end
end
