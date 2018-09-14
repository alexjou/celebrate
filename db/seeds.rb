# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Cadastrando as CATEGORIAS..."

categories = [
    "Praia",
    "Cachoeira",
    "Trilhas",
    "Esportes Radicais"
]

categories.each do |category|
  Category.friendly.find_or_create_by(description: category)
end

puts "CATEGORIAS cadastradas com sucesso!"

  #################################################################

  puts "Cadastrando ADMIN..."

      Admin.create!(
        name: "Admin",
        email: "admin@admin.com",
        password: "33286483",
        password_confirmation: "33286483"
      )

    puts "ADMIN cadastrados com sucesso!"

  #################################################################

    puts "Cadastrando USUARIO PADRÃO..."

    User.create!(
      email: "user@user.com",
      password: "123456",
      password_confirmation: "123456"
    )

  puts "USUARIO PADRÃO cadastrado com sucesso!"

#################################################################