# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Iniciando a criação de dados..."
# criar um usuário
user = User.create!(email: "user@gmail.com", password: "123456", password_confirmation: "123456")

# criar uma empresa
company = Company.new(name: "Vet Company", url: "www.google.com", user_id: user.id)
company.logo.attach(io: File.open("#{Rails.root}/app/assets/images/logo-vet.png"), filename: "logo-vet.png")
company.save!

# cidade e estado
cities_and_states = [['MG', 'Minas Gerais'], ['SP', 'Sao Paulo'], ['RJ', 'Rio de Janeiro']]

# criar vagas
5.times do |t|
    city_and_state = cities_and_states.sample
    Position.create!(
        name: Faker::Creature::Animal.name,
        career: (0..7).to_a.sample,
        contract: (0..2).to_a.sample,
        remote: false,
        publish: true,
        state: city_and_state.first,
        city: city_and_state.last,
        company_id: company.id,
        description: "A Vet Company é uma empresa que atua no mercado de saúde animal. Estamos em busca de um profissional para atuar como médico veterinário.",
        summary: "Médico Veterinário",
    )
end
puts "Dados criados com sucesso!"
