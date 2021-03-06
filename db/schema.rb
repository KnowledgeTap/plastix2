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

ActiveRecord::Schema.define(:version => 20110325002338) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parentid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "homes", :force => true do |t|
    t.string   "name"
    t.text     "main"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "parentid"
    t.string   "name"
    t.string   "model"
    t.string   "ports"
    t.string   "valve"
    t.string   "color"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "description"
    t.string   "type"
    t.string   "style"
    t.string   "inlet"
    t.string   "hose"
    t.string   "plug"
    t.string   "weight"
    t.string   "quanity"
    t.string   "partno"
    t.string   "portno"
    t.string   "prodtype"
    t.string   "custom1"
    t.integer  "custom1check", :limit => 1
    t.string   "custom1name"
    t.string   "thread"
    t.string   "flow"
  end

end
