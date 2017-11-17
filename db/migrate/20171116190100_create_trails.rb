class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :description
      t.string :notes
      t.string :maplink
      t.string :kmlfile
      t.string :reservoir

      t.timestamps
    end
  end
end
