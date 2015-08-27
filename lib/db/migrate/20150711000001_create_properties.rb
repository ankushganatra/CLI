require_relative '../../config/environment'

class CreatePropertyTable < ActiveRecord::Migration

  def self.up
    create_table :properties do |t|
      t.string :title
      t.string :property_type, default: nil
      t.string :address
      t.float :nightly_rate_in_eur
      t.integer :max_guests
      t.string :email
      t.string :phone_number, :limit => 15
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :properties
  end
end