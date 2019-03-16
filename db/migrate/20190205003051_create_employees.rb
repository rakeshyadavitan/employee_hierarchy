class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
    	t.string :name
    	t.integer :vp_id
    	t.integer :director_id
    	t.integer :manager_id
    	t.integer :salary
    	t.integer :rating
      t.timestamps
    end
  end
end
