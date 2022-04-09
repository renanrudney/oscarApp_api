class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.integer :remote_movie_id, null: false
      t.integer :remote_director_id, null: false
      t.references :user

      t.timestamps
    end
  end
end
