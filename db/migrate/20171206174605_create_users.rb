class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uidname
      t.datetime :oauth_tokenoauth_expires_at

      t.timestamps
    end
  end
end
