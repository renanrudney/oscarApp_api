class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.integer :token_number
      t.references :user

      t.timestamps
    end
  end
end
