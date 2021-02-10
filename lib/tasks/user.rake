require 'csv'
require 'pry'

namespace :user do
  desc 'USER_IMPORT'
  task import: :environment do
    path = ENV['path']
    users = []
    headers = nil
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      headers ||= row.headers
      users << row
    end

    users_attributes = users.map(&:to_h)
    users_attributes.each do |user|
      existing_user = User.find_by(id: user[:id])
      if existing_user
        existing_user.update(user)
      else
        new_user = User.new(user).save(validate: false)
      end
    end
  end

  desc 'USER_EXPORT'
  task export: :environment do
    users = User.all.map(&:attributes)
    headers = users.first&.keys

    CSV.open('users.csv', 'w') do |csv|
      csv << headers
      users.each do |user|
        csv << user.values
      end
    end
  end
end
