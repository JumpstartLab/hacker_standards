class Topic < ActiveRecord::Base

  validates_presence_of :title

  def self.available
    where(:published => true)
  end
end
