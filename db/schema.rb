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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140504203712) do

  create_table "agencies", force: true do |t|
    t.string   "title"
    t.string   "reg_number"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "title"
    t.string   "reg_number"
    t.string   "phone"
    t.string   "contact"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: true do |t|
    t.integer  "agency_id"
    t.date     "date"
    t.decimal  "discount"
    t.string   "notes"
    t.integer  "last_updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["agency_id"], name: "index_contracts_on_agency_id"
  add_index "contracts", ["last_updated_by"], name: "index_contracts_on_last_updated_by"

  create_table "fields", force: true do |t|
    t.string   "title"
    t.integer  "magazine_id"
    t.decimal  "height"
    t.decimal  "width"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["magazine_id"], name: "index_fields_on_magazine_id"

  create_table "invoices", force: true do |t|
    t.decimal  "total"
    t.decimal  "remaining"
    t.date     "date"
    t.date     "due_date"
    t.integer  "contract_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["contract_id"], name: "index_invoices_on_contract_id"

  create_table "issues", force: true do |t|
    t.integer  "magazine_id"
    t.integer  "number"
    t.date     "date"
    t.date     "due_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["magazine_id"], name: "index_issues_on_magazine_id"

  create_table "magazines", force: true do |t|
    t.string   "title"
    t.integer  "issue"
    t.integer  "prints"
    t.integer  "subscribers"
    t.integer  "readership"
    t.string   "picture"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "text"
    t.boolean  "status"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "orders", force: true do |t|
    t.integer  "issue_id"
    t.integer  "field_id"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "contract_id"
    t.string   "title"
    t.string   "notes"
    t.decimal  "total_amount"
    t.decimal  "remaining"
    t.decimal  "special"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"
  add_index "orders", ["contract_id"], name: "index_orders_on_contract_id"
  add_index "orders", ["field_id"], name: "index_orders_on_field_id"
  add_index "orders", ["issue_id"], name: "index_orders_on_issue_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "payments", force: true do |t|
    t.integer  "invoice_id"
    t.decimal  "amount"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["invoice_id"], name: "index_payments_on_invoice_id"

  create_table "roles", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true

  create_table "user_roles", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["agency_id"], name: "index_users_on_agency_id"

end
