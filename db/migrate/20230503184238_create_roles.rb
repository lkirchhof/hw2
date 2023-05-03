class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      # confirm movie_id and actor_id
      t.integer "movie_id"
      t.integer "actor_id"
      t.string "character_name"

      t.timestamps
    end
  end
end
