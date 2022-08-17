namespace :dev do
    desc "Set up the development enviroment"
    task setup: :environment do
        puts 'Resetting the database...'
        %x(rails db:drop db:create db:migrate)
        # %x() = Execute on the termianl the commands within the '()'

        puts 'Creating kinds..'
        kinds = %w(Friend Work know)
        # the %w is a shortcut for you do not need to use "" 

        kinds.each do |k|
            Kind.create!(
            description: k
            )
        end
        puts 'Success.'

        #######################################
        puts 'Creating 100 contacts..'

        100.times do |i|
            Contact.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
            kind: Kind.all.sample
            )
        end

        puts 'Success.'

        #########################################
        puts 'Creating phones numbers'
        
        Contact.all.each do |contact|
            Random.rand(5).times do |i|
                contact.phones.create!(
                    number: Faker::PhoneNumber.cell_phone
                )
            end

            #phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
            #contact.phones << phone
            #contact.save!
        end

        puts "Success"

        #######################################
        puts 'Creatting address'

        Contact.all.each do |contact|
            Address.create!(
                street: Faker::Address.street_address,
                city: Faker::Address.city,
                contact: contact
            )
        end

        puts 'Success'
    end
end
