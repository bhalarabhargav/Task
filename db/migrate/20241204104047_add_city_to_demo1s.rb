class AddCityToDemo1s < ActiveRecord::Migration[7.0]
  def change
    add_column :demo1s, :city, :string
  end
end
