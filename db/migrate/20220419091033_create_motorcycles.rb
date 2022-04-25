class CreateMotorcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :motorcycles do |t|

      t.timestamps
      t.integer :manufacturer, defalut: 0
      t.integer :displacement, defalut: 0
      t.string  :name,         null: false
    end
  end
end
