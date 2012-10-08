class SubCategory < ActiveRecord::Base
  attr_accessible :category_id, :name, :state, :user_id
  belongs_to :category
  belongs_to :user
  validates :name, :presence => true
  validates :category_id, :presence => true
  end
