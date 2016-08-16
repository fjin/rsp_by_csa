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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160816013236) do

  create_table "account_csa_service_types", force: :cascade do |t|
    t.integer  "billing_account_id"
    t.integer  "csa_id"
    t.integer  "service_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "billing_account_csa_exclusions", force: :cascade do |t|
    t.integer  "billing_account_id"
    t.integer  "csa_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "billing_account_csas", force: :cascade do |t|
    t.integer  "csa_id"
    t.integer  "billing_account_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "billing_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "csa_service_types", force: :cascade do |t|
    t.integer  "service_types_id"
    t.integer  "csas_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "csas", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "db_lockers", force: :cascade do |t|
    t.boolean  "is_locked"
    t.datetime "lock_time"
    t.string   "locked_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inbounds", force: :cascade do |t|
    t.string   "billing_account"
    t.string   "billing_account_name"
    t.integer  "csa_id"
    t.string   "csa_name"
    t.string   "state_territory"
    t.string   "service_type_id"
    t.string   "service_type_name"
    t.datetime "inserted_ts"
    t.datetime "source_effective_from_ts"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "relationship_type"
    t.integer  "billing_account_id"
    t.integer  "rsp_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rsp_csa_exclusions", force: :cascade do |t|
    t.integer  "csa_id"
    t.integer  "rsp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsp_technology_types", force: :cascade do |t|
    t.integer  "technology_types_id"
    t.integer  "rsps_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "rsps", force: :cascade do |t|
    t.string   "home_phone"
    t.string   "business_phone"
    t.string   "home_website"
    t.string   "fibre_website"
    t.string   "satellite_website"
    t.string   "wireless_website"
    t.string   "business_website"
    t.string   "business_name"
    t.string   "name"
    t.string   "logo_name"
    t.string   "service"
    t.string   "rsp_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "code"
    t.integer  "is_deleted"
    t.string   "description"
    t.integer  "technology_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "technology_types", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
