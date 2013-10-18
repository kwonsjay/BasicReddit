class Sub < ActiveRecord::Base
  attr_accessible :user_id, :title
  validates_presence_of :user_id, :title
  validates_uniqueness_of :title

  belongs_to :user
  has_many :link_subs
  has_many :links, :through => :link_subs, :source => :link

end
