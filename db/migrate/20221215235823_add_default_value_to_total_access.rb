class AddDefaultValueToTotalAccess < ActiveRecord::Migration[6.1]
  def up
    change_column :urls, :total_access, :integer, default: 0
  end

  def down
    change_column :urls, :total_access, :integer,default: nil
  end
end
