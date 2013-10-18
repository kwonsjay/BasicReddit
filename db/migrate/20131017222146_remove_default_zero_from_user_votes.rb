class RemoveDefaultZeroFromUserVotes < ActiveRecord::Migration
  def change
    remove_column(:user_votes, :vote_val)
    add_column(:user_votes, :vote_val, :integer)
  end
end
