namespace :dev do
  desc "Set up the development enviroment"

  puts 'Creating 100 contacts..'

  task setup: :environment do
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end
  end

  puts 'Sucess.'
end
