class AddTotalVotesToPoll < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :total_votes, :integer
  end
end
