class Standard < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true, :counter_cache => true
  has_many :children, :class_name => Standard, :as => :parent

  validates_presence_of :title, :parent

  default_scope where(:deleted => false)

  def self.active_count
    count
  end
end
