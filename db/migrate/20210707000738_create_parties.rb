class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :host, foreign_key: { to_table: :users }
      t.string :movie_title
      t.date :start_date
      t.time :start_time
      t.integer :length
      t.integer :movie_id

      t.timestamps
    end
  end
end
