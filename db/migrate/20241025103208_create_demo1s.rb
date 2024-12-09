class CreateDemo1s < ActiveRecord::Migration[7.0]
  def change
    create_table :demo1s do |t|
      t.string :name
      t.text :description
      t.string :status
      t.file :string
      t.timestamps
    end
  end
end
