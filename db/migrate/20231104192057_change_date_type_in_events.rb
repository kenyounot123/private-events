class ChangeDateTypeInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :date, :datetime
  end
end
