class AddstateTodemo1s < ActiveRecord::Migration[7.0]
  def change
    add_column :demo1s, :state, :string, null: false
  end
end
