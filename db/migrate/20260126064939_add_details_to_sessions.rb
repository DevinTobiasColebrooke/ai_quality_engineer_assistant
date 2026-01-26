class AddDetailsToSessions < ActiveRecord::Migration[8.1]
  def change
    add_column :sessions, :test_plan, :text
  end
end
