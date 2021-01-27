require 'csv'

namespace :user do
  desc "USER_IMPORT"
  task import: :environment do
    path = ENV['path']
    users = []
    headers = nil
    CSV.foreach("users.csv", headers: true, header_converters: :symbol) do |row|
      headers ||= row.headers
      users << row
    end

  end

  desc "USER_EXPORT"
  task export: :environment do
    users = User.all.map(&:attributes)
    headers = users.first&.keys

    CSV.open("users.csv", "w") do |csv|
      csv << headers
      users.each do |user|
        csv << user.values
      end
    end
    
    
  end
end
