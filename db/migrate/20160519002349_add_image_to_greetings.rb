class AddImageToGreetings < ActiveRecord::Migration
  def change
    add_column :greetings, :image, :string, default: "", after: :is_enable
  end
end
