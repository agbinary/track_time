class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :track_type, null: false
      t.string :name
      t.time :start_time, null: false
      t.time :end_time
      t.date :date_report, null: false
      t.integer :total_time
      t.integer :status, null: false
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :project, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
