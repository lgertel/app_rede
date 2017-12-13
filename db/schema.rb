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

ActiveRecord::Schema.define(version: 20171212172331) do

  create_table "admin_flows", force: :cascade do |t|
    t.integer "flow_type"
    t.integer "stage"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_admin_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_admin_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_admin_roles_on_resource_type_and_resource_id"
  end

  create_table "admin_tickets", force: :cascade do |t|
    t.integer "flow_id"
    t.integer "ticket_type"
    t.string "cnpj"
    t.string "name"
    t.string "description"
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "audio"
    t.string "dossier"
    t.boolean "dossier_status"
    t.boolean "debits_status"
    t.boolean "comercial_status"
    t.boolean "rollout_customer_validate"
    t.string "report"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admin_users_admin_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_admin_users_admin_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_admin_users_admin_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_admin_users_admin_roles_on_user_id"
  end

end
