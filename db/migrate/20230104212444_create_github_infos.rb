class CreateGithubInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :github_infos do |t|
      t.string :repository_route
      t.string :github_token
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
