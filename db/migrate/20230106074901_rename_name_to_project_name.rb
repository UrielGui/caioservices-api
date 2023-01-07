class RenameNameToProjectName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :project_name
  end
end
