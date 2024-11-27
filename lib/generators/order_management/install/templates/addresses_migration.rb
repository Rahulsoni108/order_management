class CreateAddresses < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :zip_code
      t.string :contact_number
      t.timestamps
    end
    add_reference :addresses, :user, index: true
  end
end
