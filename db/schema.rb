# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "USER", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "user_name", limit: 12, null: false
    t.string "password", limit: 12, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["user_id"], name: "user_pk", unique: true
  end

  create_table "appointments", primary_key: "appoin_id", id: :serial, force: :cascade do |t|
    t.string "appoin_description", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["appoin_id"], name: "appointment_pk", unique: true
  end

  create_table "audit", primary_key: "audit_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "audit_table", null: false
    t.integer "audit_action", null: false
    t.index ["audit_id"], name: "audit_pk", unique: true
  end

  create_table "branch", primary_key: "branch_id", id: :serial, force: :cascade do |t|
    t.string "branch_descrip", limit: 100, null: false
    t.string "brand_address", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["branch_id"], name: "branch_pk", unique: true
  end

  create_table "brand", primary_key: "brand_id", id: :serial, force: :cascade do |t|
    t.string "brand_descrip", limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["brand_id"], name: "brand_pk", unique: true
  end

  create_table "buy_details", primary_key: "buy_details_id", id: :serial, force: :cascade do |t|
    t.integer "buy_id"
    t.integer "product_id"
    t.integer "bdetails_qty", null: false
    t.float "bdetails_price", null: false
    t.integer "bdetails_discount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["buy_details_id"], name: "buy_details_pk", unique: true
    t.index ["buy_id"], name: "buy_id_fk_b_details"
    t.index ["product_id"], name: "product_id_fk_b_details"
  end

  create_table "buys", primary_key: "buy_id", id: :serial, force: :cascade do |t|
    t.integer "person_id"
    t.date "buy_date", null: false
    t.string "buy_invoice_number", limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["buy_id"], name: "buy_pk", unique: true
    t.index ["person_id"], name: "provider_id_fk_buy"
  end

  create_table "category", primary_key: "cat_id", id: :serial, force: :cascade do |t|
    t.string "cat_descript", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["cat_id"], name: "categoria_pk", unique: true
  end

  create_table "city", primary_key: "city_id", id: :serial, force: :cascade do |t|
    t.string "city_descrip", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["city_id"], name: "city_pk", unique: true
  end

  create_table "clients", primary_key: "person_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "wplace_id"
    t.string "direc_cliente", limit: 255, null: false
    t.float "credit_limit", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["person_id"], name: "client_fk_client"
    t.index ["person_id"], name: "client_pk", unique: true
    t.index ["wplace_id"], name: "wplace_fk_client"
  end

  create_table "contact_person", primary_key: "c_person_id", id: :serial, force: :cascade do |t|
    t.integer "person_id"
    t.integer "ctype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["c_person_id"], name: "c_person_fk", unique: true
    t.index ["ctype_id"], name: "c_type_fk_c_person"
    t.index ["person_id"], name: "person_fk_c_person"
  end

  create_table "contact_type", primary_key: "ctype_id", id: :serial, force: :cascade do |t|
    t.string "ctype_descrip", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["ctype_id"], name: "contact_type_pk", unique: true
  end

  create_table "credit", primary_key: "credit_id", id: :serial, force: :cascade do |t|
    t.integer "petitioner_id"
    t.integer "supervisor_id"
    t.integer "person_id"
    t.date "request_date", null: false
    t.date "acceptance_date__"
    t.integer "fee_qty", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["credit_id"], name: "credit_pk", unique: true
    t.index ["person_id"], name: "client_fk_credit"
    t.index ["petitioner_id"], name: "petitioner_fk_credit"
    t.index ["supervisor_id"], name: "supervisor_fk_credit"
  end

  create_table "credit_fee", primary_key: "cre_fee_id", id: :serial, force: :cascade do |t|
    t.integer "credit_id", null: false
    t.integer "fee_number", null: false
    t.integer "fee_amount", null: false
    t.date "cf_due_date", null: false
    t.float "cf_interest", null: false
    t.float "cf_pay_amount", null: false
    t.string "cf_state", limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["cre_fee_id"], name: "credit_fee_pk", unique: true
    t.index ["credit_id"], name: "credit_fk_c_fee"
  end

  create_table "districts", primary_key: "district_id", id: :serial, force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "district_descrip", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["city_id"], name: "city_fk_district"
    t.index ["district_id"], name: "district_pk", unique: true
  end

  create_table "employees", primary_key: "person_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "appoin_id"
    t.integer "user_id"
    t.integer "branch_id"
    t.date "person_startdate"
    t.boolean "person_status"
    t.string "person_observation", limit: 255
    t.float "person_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["appoin_id"], name: "apointment_fk_employees"
    t.index ["branch_id"], name: "branch_fk_employees"
    t.index ["person_id"], name: "employees_fk"
    t.index ["person_id"], name: "employees_pk", unique: true
    t.index ["user_id"], name: "user_fk_employees"
  end

  create_table "movement_type", primary_key: "m_type_id", id: :serial, force: :cascade do |t|
    t.string "description", limit: 255, null: false
    t.boolean "move_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["m_type_id"], name: "m_type_pk", unique: true
  end

  create_table "payment_method", primary_key: "p_method_id", id: :serial, force: :cascade do |t|
    t.string "pm_descrip", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["p_method_id"], name: "p_method_pk", unique: true
  end

  create_table "permits", primary_key: "permits_id", id: :serial, force: :cascade do |t|
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["permits_id"], name: "permits_pk", unique: true
    t.index ["role_id"], name: "role_fk_permits"
  end

  create_table "permits_x_user", primary_key: "p_user_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "permits_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["p_user_id"], name: "permits_user_pk", unique: true
    t.index ["permits_id"], name: "permits_fk_p_user"
    t.index ["user_id"], name: "user_fk_p_user"
  end

  create_table "person", primary_key: "person_id", id: :serial, force: :cascade do |t|
    t.integer "district_id"
    t.string "nombre", limit: 100, null: false
    t.string "last_name", limit: 100, null: false
    t.string "cedula", limit: 10, null: false
    t.string "ruc", limit: 12, null: false
    t.string "home_address", limit: 255, null: false
    t.string "business_name", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["district_id"], name: "distric_fk_person"
    t.index ["person_id"], name: "person_pk", unique: true
  end

  create_table "prod_transfer_details", primary_key: "pt_details_id", id: :serial, comment: "state para control de recepcion por producto", force: :cascade do |t|
    t.integer "prod_transfer_id", null: false
    t.integer "product_id", null: false
    t.integer "pt_det_qty", null: false
    t.boolean "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["prod_transfer_id"], name: "prod_transfer_id_fk_pt_details"
    t.index ["product_id"], name: "prod_id_fk_pt_details"
    t.index ["pt_details_id"], name: "prod_transfer_details_pk", unique: true
  end

  create_table "prod_transfers", primary_key: "prod_transfer_id", id: :serial, comment: "state para {\npedido,\nenviado,\nrecibido\n}", force: :cascade do |t|
    t.integer "br_origin_id", null: false
    t.integer "br_destination_id", null: false
    t.date "transfer_date", null: false
    t.string "state", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["br_destination_id"], name: "branch_destination_fk"
    t.index ["br_origin_id"], name: "branch_origin_fk"
    t.index ["prod_transfer_id"], name: "prod_transfer_pk", unique: true
  end

  create_table "product", primary_key: "product_id", id: :serial, force: :cascade do |t|
    t.integer "sub_cat_id"
    t.integer "brand_id"
    t.integer "person_id"
    t.string "prod_descrip", limit: 100, null: false
    t.integer "prod_iva", null: false
    t.float "prod_sale_price", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["brand_id"], name: "brand_prod_fk"
    t.index ["person_id"], name: "provider_prod_fk"
    t.index ["product_id"], name: "producto_pk", unique: true
    t.index ["sub_cat_id"], name: "sub_cat_prod_fk"
  end

  create_table "provider", primary_key: "person_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "prov_activo", null: false
    t.string "obs", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["person_id"], name: "person_id_fk_provider"
    t.index ["person_id"], name: "provider_pk", unique: true
  end

  create_table "roles", primary_key: "role_id", id: :serial, force: :cascade do |t|
    t.string "role_descrip", limit: 200, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["role_id"], name: "role_pk", unique: true
  end

  create_table "sales", primary_key: "sales_id", id: :serial, force: :cascade do |t|
    t.integer "branch_id", null: false
    t.integer "person_id"
    t.integer "emp_person_id"
    t.date "sale_date", null: false
    t.string "receipt_number", limit: 20, null: false
    t.boolean "aprobado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["branch_id"], name: "branch_fk_sales"
    t.index ["emp_person_id"], name: "employee_fk_sales"
    t.index ["person_id"], name: "client_fk_sales"
    t.index ["sales_id"], name: "venta_pk", unique: true
  end

  create_table "sales_details", primary_key: "sales_det_id", id: :serial, force: :cascade do |t|
    t.integer "sales_id"
    t.integer "product_id"
    t.integer "sale_prod_qty", null: false
    t.float "sale_discount_", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["product_id"], name: "product_fk_s_details"
    t.index ["sales_det_id"], name: "sales_details_pk", unique: true
    t.index ["sales_id"], name: "sales_fk_s_details"
  end

  create_table "stock", primary_key: "stock_id", id: :serial, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "branch_id"
    t.integer "stock_qty", null: false
    t.integer "stock_min", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["branch_id"], name: "brach_fk_stock"
    t.index ["product_id"], name: "product_fk_stock"
    t.index ["stock_id"], name: "stock_pk", unique: true
  end

  create_table "sub_category", primary_key: "sub_cat_id", id: :serial, force: :cascade do |t|
    t.integer "cat_id", null: false
    t.string "sub_cat_descrip", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["cat_id"], name: "category_sub_cat_fk"
    t.index ["sub_cat_id"], name: "sub_categoria_pk", unique: true
  end

  create_table "till_transfers", primary_key: "tilltrans_id", id: :serial, comment: "Se registra las transferencias entre cajas", force: :cascade do |t|
    t.integer "tills_origin_id"
    t.integer "tills_destiny_id"
    t.date "tilltrans_date", null: false
    t.float "tilltrans_amount", null: false
    t.text "tilltrans_observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["tills_destiny_id"], name: "t_dertiny_fk_t_transfer"
    t.index ["tills_origin_id"], name: "t_origin_fk_t_transfer"
    t.index ["tilltrans_id"], name: "ttransf_id_pk", unique: true
  end

  create_table "tills", primary_key: "tills_id", id: :serial, force: :cascade do |t|
    t.integer "branch_id"
    t.date "t_open_date", null: false
    t.date "t_close_date", null: false
    t.date "till_transac_date", null: false
    t.boolean "till_state", null: false
    t.string "description", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["branch_id"], name: "branch_fk_tills"
    t.index ["tills_id"], name: "till_pk", unique: true
  end

  create_table "tills_details", primary_key: "till_details_id", id: :serial, force: :cascade do |t|
    t.integer "tills_id"
    t.integer "m_type_id"
    t.integer "p_method_id"
    t.string "description", limit: 255, null: false
    t.float "amount", null: false
    t.date "transac_date", null: false
    t.float "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["m_type_id"], name: "m_type_fk_t_details"
    t.index ["p_method_id"], name: "p_method_fk_t_details"
    t.index ["till_details_id"], name: "till_details_pk", unique: true
    t.index ["tills_id"], name: "tills_fk_t_details"
  end

  create_table "workplaces", primary_key: "wplace_id", id: :serial, force: :cascade do |t|
    t.string "description", limit: 255, null: false
    t.string "address", limit: 255, null: false
    t.string "telephone", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["wplace_id"], name: "wplace_pk", unique: true
  end

  add_foreign_key "audit", "\"USER\"", column: "user_id", primary_key: "user_id", name: "fk_audit_reference_user", on_update: :restrict, on_delete: :restrict
  add_foreign_key "buy_details", "buys", primary_key: "buy_id", name: "fk_buy_deta_relations_buys", on_update: :restrict, on_delete: :restrict
  add_foreign_key "buy_details", "product", primary_key: "product_id", name: "fk_buy_deta_relations_product", on_update: :restrict, on_delete: :restrict
  add_foreign_key "buys", "provider", column: "person_id", primary_key: "person_id", name: "fk_buys_relations_provider", on_update: :restrict, on_delete: :restrict
  add_foreign_key "clients", "person", primary_key: "person_id", name: "fk_clients_reference_person", on_update: :restrict, on_delete: :restrict
  add_foreign_key "clients", "workplaces", column: "wplace_id", primary_key: "wplace_id", name: "fk_clients_reference_workplac", on_update: :restrict, on_delete: :restrict
  add_foreign_key "contact_person", "contact_type", column: "ctype_id", primary_key: "ctype_id", name: "fk_contact__reference_contact_", on_update: :restrict, on_delete: :restrict
  add_foreign_key "contact_person", "person", primary_key: "person_id", name: "fk_contact__reference_person", on_update: :restrict, on_delete: :restrict
  add_foreign_key "credit", "employees", column: "petitioner_id", primary_key: "person_id", name: "fk_credit_reference_petitioner", on_update: :restrict, on_delete: :restrict
  add_foreign_key "credit", "employees", column: "supervisor_id", primary_key: "person_id", name: "fk_credit_reference_supervisor", on_update: :restrict, on_delete: :restrict
  add_foreign_key "credit", "person", primary_key: "person_id", name: "fk_credit_reference_person", on_update: :restrict, on_delete: :restrict
  add_foreign_key "credit_fee", "credit", primary_key: "credit_id", name: "fk_credit_f_relations_credit", on_update: :restrict, on_delete: :restrict
  add_foreign_key "districts", "city", primary_key: "city_id", name: "fk_district_relations_city", on_update: :restrict, on_delete: :restrict
  add_foreign_key "employees", "\"USER\"", column: "user_id", primary_key: "user_id", name: "fk_employee_reference_user", on_update: :restrict, on_delete: :restrict
  add_foreign_key "employees", "appointments", column: "appoin_id", primary_key: "appoin_id", name: "fk_employee_reference_appointm", on_update: :restrict, on_delete: :restrict
  add_foreign_key "employees", "branch", primary_key: "branch_id", name: "fk_employee_reference_branch", on_update: :restrict, on_delete: :restrict
  add_foreign_key "employees", "person", primary_key: "person_id", name: "fk_employee_reference_person", on_update: :restrict, on_delete: :restrict
  add_foreign_key "permits", "roles", primary_key: "role_id", name: "fk_permits_reference_roles", on_update: :restrict, on_delete: :restrict
  add_foreign_key "permits_x_user", "\"USER\"", column: "user_id", primary_key: "user_id", name: "fk_permits__reference_user", on_update: :restrict, on_delete: :restrict
  add_foreign_key "permits_x_user", "permits", column: "permits_id", primary_key: "permits_id", name: "fk_permits__reference_permits", on_update: :restrict, on_delete: :restrict
  add_foreign_key "person", "districts", primary_key: "district_id", name: "fk_person_reference_district", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_transfer_details", "prod_transfers", primary_key: "prod_transfer_id", name: "fk_prod_tra_reference_prod_tra", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_transfer_details", "product", primary_key: "product_id", name: "fk_prod_tra_reference_product", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_transfers", "branch", column: "br_destination_id", primary_key: "branch_id", name: "fk_prod_tra_reference_destino", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_transfers", "branch", column: "br_origin_id", primary_key: "branch_id", name: "fk_prod_tra_reference_origen", on_update: :restrict, on_delete: :restrict
  add_foreign_key "product", "brand", primary_key: "brand_id", name: "fk_product_reference_brand", on_update: :restrict, on_delete: :restrict
  add_foreign_key "product", "provider", column: "person_id", primary_key: "person_id", name: "fk_product_relations_provider", on_update: :restrict, on_delete: :restrict
  add_foreign_key "product", "sub_category", column: "sub_cat_id", primary_key: "sub_cat_id", name: "fk_product_reference_sub_cate", on_update: :restrict, on_delete: :restrict
  add_foreign_key "provider", "person", primary_key: "person_id", name: "fk_provider_reference_person", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sales", "branch", primary_key: "branch_id", name: "fk_sales_relations_branch", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sales", "clients", column: "person_id", primary_key: "person_id", name: "fk_sales_reference_clients", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sales", "employees", column: "emp_person_id", primary_key: "person_id", name: "fk_sales_reference_employee", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sales_details", "product", primary_key: "product_id", name: "fk_sales_de_relations_product", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sales_details", "sales", column: "sales_id", primary_key: "sales_id", name: "fk_sales_de_relations_sales", on_update: :restrict, on_delete: :restrict
  add_foreign_key "stock", "branch", primary_key: "branch_id", name: "fk_stock_reference_branch", on_update: :restrict, on_delete: :restrict
  add_foreign_key "stock", "product", primary_key: "product_id", name: "fk_stock_relations_product", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sub_category", "category", column: "cat_id", primary_key: "cat_id", name: "fk_sub_cate_relations_category", on_update: :restrict, on_delete: :restrict
  add_foreign_key "till_transfers", "tills", column: "tills_destiny_id", primary_key: "tills_id", name: "fk_till_tra_reference_destiny", on_update: :restrict, on_delete: :restrict
  add_foreign_key "till_transfers", "tills", column: "tills_origin_id", primary_key: "tills_id", name: "fk_till_tra_reference_origin", on_update: :restrict, on_delete: :restrict
  add_foreign_key "tills", "branch", primary_key: "branch_id", name: "fk_tills_reference_branch", on_update: :restrict, on_delete: :restrict
  add_foreign_key "tills_details", "movement_type", column: "m_type_id", primary_key: "m_type_id", name: "fk_tills_de_reference_movement", on_update: :restrict, on_delete: :restrict
  add_foreign_key "tills_details", "payment_method", column: "p_method_id", primary_key: "p_method_id", name: "fk_tills_de_reference_payment_", on_update: :restrict, on_delete: :restrict
  add_foreign_key "tills_details", "tills", column: "tills_id", primary_key: "tills_id", name: "fk_tills_de_reference_tills", on_update: :restrict, on_delete: :restrict
end
