class AddManager < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :manager, :string
  end
end
