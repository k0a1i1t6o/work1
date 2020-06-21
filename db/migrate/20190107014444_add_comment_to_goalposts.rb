class AddCommentToGoalposts < ActiveRecord::Migration[5.1]
  def change
    add_column :goalposts, :comment, :text
  end
end
