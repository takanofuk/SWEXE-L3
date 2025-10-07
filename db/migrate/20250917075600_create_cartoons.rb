class CreateCartoons < ActiveRecord::Migration[8.0]
  def change
    create_table :cartoons do |t|
      t.string :title
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
