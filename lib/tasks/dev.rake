namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public','system')
    puts "Executando o setup para desenvolvimento..."

    if Rails.env.development?
      puts "APAGANDO BD... #{%x(rake db:drop)}"
      puts "Apagando imagens de public/system... #{%x(rm -rf #{images_path})}"
      puts "CRIANDO BD... #{%x(rake db:create)}"
    end
    
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_users)
    # puts %x(rake dev:generate_trips)

    puts "Setup completado com sucesso!"
  end

  #################################################################

  desc "Cria Usuarios Fake"
  task generate_users: :environment do
    puts "Cadastrando USUARIOS..."

    10.times do
      User.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
      
    end

    puts "USUARIOS cadastrados com sucesso!"
  end

  #################################################################
desc "Cria Locais Fake"
task generate_trips: :environment do
  puts "Cadastrando Locais..."

  10.times do
    Trip.create!(
      title: Faker::Lorem.sentence([2,3,4].sample),
      description_md: markdown_fake,
      description_short: Faker::Lorem.sentence([2,3].sample),
      admin: Admin.first,
      category: Category.all.sample,
      price: "#{Random.rand(400)},#{99}",
      picture: File.new(Rails.join('trip.picture.url()', 'fenixecoturismo-images', "#{Random.rand(9)}.jpg"), 'r')
    )
    end

    puts "Locais cadastradas com sucesso!"
  end
  def markdown_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end

end