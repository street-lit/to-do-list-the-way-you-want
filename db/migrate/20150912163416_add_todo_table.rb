class AddTodoTable < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.boolean :boolean, default: false
      t.timestamps null: false
    end
  end
end
