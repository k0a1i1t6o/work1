class AddToToGoalposts < ActiveRecord::Migration[5.1]
  def change
    add_column :goalposts, :to, :text
  end
end
