class AddCommentsToTrailUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :trail_users, :comments, :string, array:true, default: []
  end
end
