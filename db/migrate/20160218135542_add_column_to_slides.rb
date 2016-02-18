class AddColumnToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :p_num, :integer
  end
end
