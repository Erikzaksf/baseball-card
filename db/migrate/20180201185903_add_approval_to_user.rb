class AddApprovalToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :approved, :boolean, :default => true, :null => false
  end
end
