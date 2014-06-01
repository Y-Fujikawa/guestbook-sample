class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
