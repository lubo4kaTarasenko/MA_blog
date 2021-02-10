# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_127_133_305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.string 'group_type'
    t.integer 'status', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_groups_on_name', unique: true
  end

  create_table 'images', force: :cascade do |t|
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'imageable_type'
    t.bigint 'imageable_id'
    t.index %w[imageable_type imageable_id], name: 'index_images_on_imageable'
  end

  create_table 'memberships', force: :cascade do |t|
    t.integer 'status', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.bigint 'group_id'
    t.index ['group_id'], name: 'index_memberships_on_group_id'
    t.index %w[user_id group_id], name: 'index_memberships_on_user_id_and_group_id', unique: true
    t.index ['user_id'], name: 'index_memberships_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'published_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'birthday'
    t.json 'personal_data'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'memberships', 'groups'
  add_foreign_key 'memberships', 'users'
  add_foreign_key 'posts', 'users'
end
