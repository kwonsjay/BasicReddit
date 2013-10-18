class LinkSub < ActiveRecord::Base
  attr_accessible :sub_id, :link_id
  validates_presence_of :sub_id, :link_id

  belongs_to :sub
  belongs_to :link

end
