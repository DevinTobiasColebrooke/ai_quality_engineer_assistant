class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :url
      t.string :status
      t.string :agent

      t.timestamps
    end
    add_index :sessions, :name
  end
end
