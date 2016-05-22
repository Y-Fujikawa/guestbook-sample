class AddIsEnableToGreetings < ActiveRecord::Migration
  def up
    add_column :greetings, :is_enable, :boolean, default: true, after: :comment
		end

	def down
		remove_column :greetings, :is_enable, :boolean
	end
end
