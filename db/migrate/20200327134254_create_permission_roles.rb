class CreatePermissionRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_roles do |t|
      t.references :permission, foreign_key: true
      t.references :role, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
