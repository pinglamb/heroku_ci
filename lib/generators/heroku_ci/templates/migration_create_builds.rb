class CreateBuilds < ActiveRecord::Migration
  def change
    create_table(:builds) do |t|
      t.integer :project_id
      t.string  :identifier

      t.timestamps
    end
    add_index :builds, :project_id
  end
end
