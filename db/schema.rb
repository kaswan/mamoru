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

ActiveRecord::Schema.define(version: 20160628075806) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "gender",                 limit: 255
    t.string   "image_url",              limit: 255
    t.datetime "image_updated_at"
    t.integer  "image_file_size",        limit: 4
    t.string   "image_content_type",     limit: 255
    t.string   "image_file_name",        limit: 255
    t.string   "location",               limit: 255
    t.string   "url",                    limit: 255
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "relation_type",       limit: 255
    t.datetime "image_updated_at"
    t.integer  "image_file_size",     limit: 4
    t.string   "image_content_type",  limit: 255
    t.string   "image_file_name",     limit: 255
    t.datetime "video_updated_at"
    t.integer  "video_file_size",     limit: 4
    t.string   "video_content_type",  limit: 255
    t.string   "video_file_name",     limit: 255
    t.integer  "relation_id",         limit: 4
    t.string   "parent_type",         limit: 255,                 null: false
    t.integer  "parent_id",           limit: 4,                   null: false
    t.boolean  "deleted",                         default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "upload_file_name",    limit: 255
    t.string   "upload_content_type", limit: 255
    t.integer  "upload_file_size",    limit: 4
    t.datetime "upload_updated_at"
  end

  add_index "attachments", ["parent_type", "parent_id"], name: "index_attachments_on_parent_type_and_parent_id", using: :btree
  add_index "attachments", ["relation_type", "relation_id"], name: "index_attachments_on_relation_type_and_relation_id", using: :btree

  create_table "contact_histories", force: :cascade do |t|
    t.integer  "admin_user_id",     limit: 4,                     null: false
    t.integer  "user_id",           limit: 4,                     null: false
    t.string   "contact_type",      limit: 255
    t.datetime "contact_date_time"
    t.text     "remarks",           limit: 65535
    t.boolean  "deleted",                         default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "contact_histories", ["admin_user_id"], name: "index_contact_histories_on_admin_user_id", using: :btree
  add_index "contact_histories", ["user_id"], name: "index_contact_histories_on_user_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "parent_type", limit: 255,                   null: false
    t.integer  "parent_id",   limit: 4,                     null: false
    t.string   "title",       limit: 255
    t.text     "message",     limit: 65535
    t.boolean  "deleted",                   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "enquiries", ["parent_type", "parent_id"], name: "index_enquiries_on_parent_type_and_parent_id", using: :btree

  create_table "inheritor_informations", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,     null: false
    t.string   "name",          limit: 255
    t.string   "furigana",      limit: 255
    t.string   "gender",        limit: 255
    t.date     "date_of_birth"
    t.string   "postalcode",    limit: 255
    t.integer  "prefecture_id", limit: 4
    t.string   "address",       limit: 255
    t.string   "occupation",    limit: 255
    t.string   "relationship",  limit: 255
    t.text     "remarks",       limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "inheritor_informations", ["user_id"], name: "index_inheritor_informations_on_user_id", using: :btree

  create_table "payment_informations", force: :cascade do |t|
    t.integer  "user_id",           limit: 4,                 null: false
    t.integer  "payment_type_id",   limit: 4
    t.integer  "course_id",         limit: 4
    t.integer  "amount",            limit: 4
    t.datetime "payment_date_time"
    t.boolean  "deleted",                     default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "payment_informations", ["course_id"], name: "index_payment_informations_on_course_id", using: :btree
  add_index "payment_informations", ["payment_type_id"], name: "index_payment_informations_on_payment_type_id", using: :btree
  add_index "payment_informations", ["user_id"], name: "index_payment_informations_on_user_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort_no",    limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort_no",    limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "post_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort_no",    limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "parent_type",      limit: 255,                   null: false
    t.integer  "parent_id",        limit: 4,                     null: false
    t.integer  "post_type_id",     limit: 4
    t.integer  "post_category_id", limit: 4
    t.text     "message",          limit: 65535
    t.boolean  "pending_status",                 default: false
    t.boolean  "deleted",                        default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "posts", ["parent_type", "parent_id"], name: "index_posts_on_parent_type_and_parent_id", using: :btree
  add_index "posts", ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree
  add_index "posts", ["post_type_id"], name: "index_posts_on_post_type_id", using: :btree

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "yomigana",   limit: 255
    t.integer  "sort_no",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.integer  "admin_user_id",           limit: 4,                 null: false
    t.boolean  "all_user_view",                     default: false
    t.boolean  "user_profile_view",                 default: false
    t.boolean  "user_profile_edit",                 default: false
    t.boolean  "user_inheritor_view",               default: false
    t.boolean  "user_inheritor_edit",               default: false
    t.boolean  "user_properry_view",                default: false
    t.boolean  "user_property_edit",                default: false
    t.boolean  "user_supervisor_view",              default: false
    t.boolean  "user_supervisor_edit",              default: false
    t.boolean  "user_reservation_view",             default: false
    t.boolean  "user_reservation_edit",             default: false
    t.boolean  "user_payment_view",                 default: false
    t.boolean  "user_point_view",                   default: false
    t.boolean  "specialist_view",                   default: false
    t.boolean  "specialist_profile_view",           default: false
    t.boolean  "specialist_profile_edit",           default: false
    t.boolean  "admin_privilege",                   default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "privileges", ["admin_user_id"], name: "index_privileges_on_admin_user_id", unique: true, using: :btree

  create_table "property_informations", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                   null: false
    t.string   "type",             limit: 255
    t.integer  "property_type_id", limit: 4
    t.boolean  "deleted",                      default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "property_informations", ["property_type_id"], name: "index_property_informations_on_property_type_id", using: :btree
  add_index "property_informations", ["user_id"], name: "index_property_informations_on_user_id", using: :btree

  create_table "property_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sort_no",    limit: 4
    t.boolean  "deleted"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "schedule_entities", force: :cascade do |t|
    t.integer  "schedule_id",   limit: 4,                     null: false
    t.string   "client_type",   limit: 255
    t.integer  "client_id",     limit: 4
    t.string   "title",         limit: 255
    t.text     "remark",        limit: 65535
    t.date     "schedule_date"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "editable",                    default: true
    t.boolean  "deleted",                     default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "schedule_type", limit: 255
    t.string   "parent_type",   limit: 255,                   null: false
    t.integer  "parent_id",     limit: 4,                     null: false
    t.string   "title",         limit: 255
    t.string   "public_title",  limit: 255
    t.text     "remark",        limit: 65535
    t.date     "start_date",                                  null: false
    t.date     "end_date"
    t.boolean  "deleted",                     default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "specialist_profiles", force: :cascade do |t|
    t.integer  "specialist_id",     limit: 4,     null: false
    t.string   "name",              limit: 255
    t.string   "furigana",          limit: 255
    t.date     "date_of_birth"
    t.string   "postalcode",        limit: 255
    t.integer  "prefecture_id",     limit: 4
    t.string   "address",           limit: 255
    t.string   "enterprise",        limit: 255
    t.string   "qualification",     limit: 255
    t.string   "specialized_field", limit: 255
    t.text     "introduction",      limit: 65535
    t.string   "home_page_url",     limit: 255
    t.text     "remarks",           limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "specialist_profiles", ["specialist_id"], name: "index_specialist_profiles_on_specialist_id", unique: true, using: :btree

  create_table "specialists", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "gender",                 limit: 255
    t.string   "image_url",              limit: 255
    t.datetime "image_updated_at"
    t.integer  "image_file_size",        limit: 4
    t.string   "image_content_type",     limit: 255
    t.string   "image_file_name",        limit: 255
    t.string   "location",               limit: 255
    t.string   "url",                    limit: 255
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "specialists", ["email"], name: "index_specialists_on_email", unique: true, using: :btree
  add_index "specialists", ["reset_password_token"], name: "index_specialists_on_reset_password_token", unique: true, using: :btree

  create_table "study_courses", force: :cascade do |t|
    t.string   "parent_type",     limit: 255,                   null: false
    t.integer  "parent_id",       limit: 4,                     null: false
    t.string   "name",            limit: 255
    t.text     "summary",         limit: 65535
    t.integer  "attachment_id",   limit: 4
    t.integer  "payment_type_id", limit: 4
    t.boolean  "is_free"
    t.integer  "price",           limit: 4
    t.boolean  "deleted",                       default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "study_courses", ["parent_id"], name: "index_study_courses_on_parent_id", using: :btree

  create_table "supervised_users", force: :cascade do |t|
    t.integer  "admin_user_id", limit: 4,                 null: false
    t.integer  "user_id",       limit: 4,                 null: false
    t.boolean  "deleted",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "supervised_users", ["admin_user_id", "user_id"], name: "index_supervised_users_on_admin_user_id_and_user_id", unique: true, using: :btree

  create_table "tutorials", force: :cascade do |t|
    t.integer  "study_course_id",        limit: 4
    t.string   "title",                  limit: 255
    t.text     "summary",                limit: 65535
    t.integer  "image_attachment_id",    limit: 4
    t.integer  "material_attachment_id", limit: 4
    t.boolean  "is_free"
    t.integer  "price",                  limit: 4
    t.boolean  "deleted",                              default: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "tutorials", ["study_course_id"], name: "index_tutorials_on_study_course_id", using: :btree

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,     null: false
    t.string   "name",          limit: 255
    t.string   "furigana",      limit: 255
    t.date     "date_of_birth"
    t.string   "postalcode",    limit: 255
    t.integer  "prefecture_id", limit: 4
    t.string   "address",       limit: 255
    t.string   "occupation",    limit: 255
    t.string   "interest",      limit: 255
    t.text     "remarks",       limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "gender",                 limit: 255
    t.string   "image_url",              limit: 255
    t.datetime "image_updated_at"
    t.integer  "image_file_size",        limit: 4
    t.string   "image_content_type",     limit: 255
    t.string   "image_file_name",        limit: 255
    t.string   "location",               limit: 255
    t.string   "url",                    limit: 255
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
