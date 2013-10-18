class UserVote < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :vote_val
  validates_presence_of :user_id, :link_id
  validates :vote_val, inclusion: { in: [-1, 1] }

  belongs_to :user
  belongs_to :link


end
