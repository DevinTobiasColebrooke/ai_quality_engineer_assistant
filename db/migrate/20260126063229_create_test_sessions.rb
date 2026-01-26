class CreateTestSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :test_sessions do |t|
      t.string :url, null: false
      t.text :goal, null: false
      t.string :status, default: "pending"
      t.text :notes

      t.timestamps
    end
  end
end
