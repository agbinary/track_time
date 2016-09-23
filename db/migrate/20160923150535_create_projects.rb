class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false 
      t.belongs_to :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
