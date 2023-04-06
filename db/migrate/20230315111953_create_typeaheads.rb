class CreateTypeaheads < ActiveRecord::Migration[7.0]
  def change
    create_table :typeaheads do |t|

      t.timestamps
    end
  end
end
