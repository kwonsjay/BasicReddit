class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :parent_id, :link_id

  validates_presence_of :body, :user_id, :link_id

  has_many(
  :child_comments,
  :class_name => "Comment",
  :foreign_key => :parent_id,
  :primary_key => :id
  )

  belongs_to(
  :parent_comment,
  :class_name => "Comment",
  :foreign_key => :parent_id,
  :primary_key => :id
  )
end
