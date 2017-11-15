class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :poll, foreign_key: true
      
      t.text "answer"

      t.timestamps
    end
  end
end
