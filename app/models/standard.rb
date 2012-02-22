class Standard < ActiveRecord::Base
  belongs_to :topic, :foreign_key => 'parent_id'

  validates_presence_of :title
end
