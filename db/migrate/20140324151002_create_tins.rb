class CreateTins < ActiveRecord::Migration
  def change
    create_table :tins do |t|
      t.string :description

      t.timestamps
    end
  end
end
