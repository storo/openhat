class CategoriesController < ApplicationController
  
  def index
        @id = params[:id]
        @cat = Category.find(:first, :conditions => ['name LIKE ?', params[:id]])
        @stages = Stage.find(:all, :conditions => ['category_id = ? AND delete_status = 0', @cat.id])
        @performance_random = Stage.find(:all, :limit => 5, :order => 'rand()', :conditions =>['delete_status = 0'])

  end

  def all

    @stages = Stage.find(:all, :order => 'id DESC', :conditions =>['delete_status = 0'])
    @performance_random = Stage.find(:all, :limit => 5, :order => 'rand()', :conditions =>['delete_status = 0'])

  end


  
end
