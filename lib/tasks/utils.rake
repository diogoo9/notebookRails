namespace :utils do
  desc "gerar dados iniciais"
  task seed: :environment do

    #gerando os tipos de contatos 
    puts "gerando contatos"
    Contact.create!(
      name: Faker::Name.name, 
      email: Faker::Internet.email, 
      kind: Kind.all.sample, 
      rmk: ".....1"
      )
    puts 'Gerando  contatos [ok]'

    puts 'Gerando  enderecos'
    Contact.all.each do |contact|       
      Address.create!(
      street:Faker::Address.street_name, 
      city:Faker::Address.city, 
      state:Faker::Address.state,
      contact:Contact.all.sample)
      puts 'Gerando  enderecos [ok]'
    end 

    puts "gerando phones"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        Phone.create(
          phone:Faker::PhoneNumber.phone_number,       
          contact: contact
        )
      end
    end
    puts "gerando phones [ok]"
  end

end
