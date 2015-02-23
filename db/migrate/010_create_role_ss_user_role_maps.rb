class CreateRoleSsUserRoleMaps < ActiveRecord::Migration
  def change
    create_table :role_ss_user_role_maps do |t|
      t.integer :user_id
      t.integer :role_id
      t.timestamps null: false

      t.index [:user_id, :role_id], unique: true
    end
  end
end
