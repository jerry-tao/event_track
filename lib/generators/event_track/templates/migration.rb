class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to :trackable, :polymorphic => true
      t.belongs_to :owner, :polymorphic => true
      t.string :key
      t.text :parameters

      t.timestamps
    end

    add_index :events, [:trackable_id, :trackable_type]
    add_index :events, [:owner_id, :owner_type]
  end

  # Drop table
  def self.down
    drop_table :events
  end
end
