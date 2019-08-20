namespace :utils do
  desc "TODO"
  task seed: :environment do

    #gerando os tipos de contatos 
    Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, kind: Kind.all.sample, rmk: Faker::Lorem.paragraph(2))
    puts 'Gerando  contatos'

    Contact.each do |contact| 
      Addresses.create!(
      street:Faker::Address.street_name, 
      city:Faker::Address.city, 
      state:Faker::Address.state,
      contact:Contact.all.sample)
      puts 'Gerando  enderecos'
    end 

    Contact.each do |contact|
      Random.rand(5).times do |i|
        Phone.create(
          phone:Faker::PhoneNumber.phone_number,       
          contact: contact
        )
      end
    end
  end

end
