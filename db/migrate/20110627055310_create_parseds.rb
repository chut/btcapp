class CreateParseds < ActiveRecord::Migration
  def self.up
    create_table :parseds do |t|
      t.float :confirmed_rewards
      t.float :estimated_rewards
      t.float :payouts
      t.float :unconfirmed_rewards
      t.integer :worker_num
      t.string :worker_name
      t.float :hash_rate
      t.integer :round_shares
      t.integer :round_stales
      t.integer :reset_shares
      t.integer :reset_stales
      t.integer :total_shares
      t.time :last_share
      t.float :pool_hash_rate
      t.time :round_time

      t.timestamps
    end
  end

  def self.down
    drop_table :parseds
  end
end
