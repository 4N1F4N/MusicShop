class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title

      t.timestamps
    end

    Tag.create(title: "Клавишные")
    Tag.create(title: "Духовые")
    Tag.create(title: "Струнные")

    add_reference :products, :tag, index: true
  end
end
