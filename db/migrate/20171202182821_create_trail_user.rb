class CreateTrailUser < ActiveRecord::Migration[5.1]
  def change
    create_table :trail_users do |t|
      t.integer  :trail_id
      t.integer  :user_id

      t.timestamps
    end
  end
end
