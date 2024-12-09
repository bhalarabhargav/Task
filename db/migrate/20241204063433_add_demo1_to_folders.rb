class AddDemo1ToFolders < ActiveRecord::Migration[7.0]
  def change
    add_reference :folders, :demo1, foreign_key: true
  end
end
