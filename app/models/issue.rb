class Issue < ActiveRecord::Base
  
  belongs_to :user
  has_many :votes, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy, :order => 'created_at asc'
  has_many :follows, :as => :followable, :dependent => :destroy
  has_many :followers, :through => :follows, :source => :user
  has_many :themings, :dependent => :destroy
  has_many :themes, :through => :themings
  
  acts_as_taggable
  acts_as_taggable_on :labels
  
  scope :lastest, order('created_at desc')
  scope :most_commented, where('comments_count > 0').order('comments_count desc')
  scope :most_voted, where('votes_count > 0').order('votes_count desc')
  
  attr_accessible :title, :body, :tag_list, :label_list, :labels, :theme_ids
  
  MAXLENGTH = { :title => 100, :body => 10000 }
  
  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => MAXLENGTH[:title] }
  validates :body, :presence => true, :length => { :maximum => MAXLENGTH[:body] }
end
