class CreateGoalposts < ActiveRecord::Migration[5.1]
  def change
    create_table :goalposts do |t|
      t.text :from
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :goalposts, [:user_id, :created_at]
  end
end
