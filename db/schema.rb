# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130602195814) do

  create_table "tgl_rows", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "client"
    t.string   "task"
    t.string   "description"
    t.boolean  "billable"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "tags"
    t.decimal  "usd_amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
