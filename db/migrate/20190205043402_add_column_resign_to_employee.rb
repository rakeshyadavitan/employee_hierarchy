class AddColumnResignToEmployee < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :resign, :boolean, default: false
  end
end
