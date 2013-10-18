class Link < ActiveRecord::Base
  attr_accessible :user_id, :url, :title, :body
  validates_presence_of :user_id, :url, :title, :body
  validates_uniqueness_of :url

  belongs_to :user
  has_many :link_subs
  has_many :subs, :through => :link_subs, :source => :sub

end
