class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id, null: false
      t.integer :link_id, null: false
      t.integer :vote_val, null: false, default: 0
      t.timestamps
    end
  end
end
