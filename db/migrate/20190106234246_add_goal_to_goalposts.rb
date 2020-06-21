class AddGoalToGoalposts < ActiveRecord::Migration[5.1]
  def change
    add_column :goalposts, :goal, :text
  end
end
