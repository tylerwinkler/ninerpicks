class AddTotalvotesToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :totalvotes, :integer
  end
end
