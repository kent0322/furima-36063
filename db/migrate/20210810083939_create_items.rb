class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer    :area_id     , null: false
      t.integer    :condition_id     , null: false
      t.integer    :days_id     , null: false
      t.integer    :load_id     , null: false
      t.integer    :category_id     , null: false
      t.string     :name        ,null: false
      t.text       :explanation ,null: false
      t.references :user        ,null: false, foreign_key: true
      t.integer    :price       ,null: false
    end
  end
end
