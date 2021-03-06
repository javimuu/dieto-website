class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.float :weight, null: false
      t.text :comment

      t.timestamps null: false
      
      t.belongs_to :user, index: true
    end
  end
end
