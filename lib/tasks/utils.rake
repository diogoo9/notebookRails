namespace :utils do
  desc "gerar dados iniciais"
  task seed: :environment do

    #gerando os tipos de contatos 
    
    100.times do |i|
      puts "gerando contatos"
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        kind: Kind.all.sample, 
        rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
        )
        puts 'Gerando  contatos [ok]'
    end 
    

    puts 'Gerando  enderecos'
    Contact.all.each do |contact|       
      Address.create!(
        street:Faker::Address.street_name, 
        city:Faker::Address.city, 
        state:Faker::Address.state,
        contact: contact
      )
      puts 'Gerando  enderecos [ok]'
    end 

    puts "gerando phones"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create(
          phone:Faker::PhoneNumber.phone_number,       
          contact: contact
        )
      end
    end
    puts "gerando phones [ok]"
  end

end
