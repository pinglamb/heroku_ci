class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.string :name
      t.string :repository
      t.string :host
      t.text   :ssh_key

      t.timestamps
    end
  end
end
