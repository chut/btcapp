class ChangeTimeDatatype < ActiveRecord::Migration
  def self.up
	change_table :parseds do |t|
	t.change :last_share, :string
	t.change :round_time, :string
	end
  end

  def self.down
	change_table :parseds do |t|
        t.change :last_share, :time
        t.change :round_time, :time
	end
  end
end
