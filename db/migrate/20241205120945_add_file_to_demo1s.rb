class AddFileToDemo1s < ActiveRecord::Migration[7.0]
  def change
    add_column :demo1s, :file, :string
  end
end
