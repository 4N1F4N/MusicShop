class CreateProfileStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_statuses do |t|
      t.string :title
      t.integer :access_level

      t.timestamps
    end

    add_reference :profiles, :profile_statuses, index: true
  end
end
