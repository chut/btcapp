# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110627091230) do

  create_table "parseds", :force => true do |t|
    t.float    "confirmed_rewards"
    t.float    "estimated_rewards"
    t.float    "payouts"
    t.float    "unconfirmed_rewards"
    t.integer  "worker_num"
    t.string   "worker_name"
    t.float    "hash_rate"
    t.integer  "round_shares"
    t.integer  "round_stales"
    t.integer  "reset_shares"
    t.integer  "reset_stales"
    t.integer  "total_shares"
    t.string   "last_share"
    t.float    "pool_hash_rate"
    t.string   "round_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
