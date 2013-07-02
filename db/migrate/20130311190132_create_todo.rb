class CreateTodo < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :body
      t.string :list_name, :default => ""
      t.integer :status, :default => 0
    end
  end
end
