class Topic < ActiveRecord::Base

  validates_presence_of :title

  has_many :standards, :foreign_key => 'parent_id'

  def self.available
    where(:published => true)
  end
end
