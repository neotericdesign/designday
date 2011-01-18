class Helpdoc < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]
  
  validates :title, :presence => true, :uniqueness => true
  
end
