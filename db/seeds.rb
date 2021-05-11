User.destroy_all
Concert.destroy_all
Ticket.destroy_all 

20.times do
    User.create!(
        name: Faker::Name.name, 
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: "letmein"
    )
end


50.times do
    Concert.create!(
        headliner: [Faker::Games::Fallout.faction, Faker::Games::StreetFighter.stage, Faker::Movies::LordOfTheRings.location, Faker::TvShows::TwinPeaks.location].sample,
        opener: Faker::Name.name_with_middle,
        date: Faker::Date.between(from: '2022-01-01', to: '2022-06-30'),
        time: ["19:00:00", "22:00:00", "00:00:00"].sample, 
        sold_out: Faker::Boolean.boolean(true_ratio: 0.1),
        price: [15.00, 25.00, 35.00, 45.00, 60.00].sample
    )
end 

150.times do
    Ticket.create!(
        confirmation: Faker::Number.number(digits: 15),
        quantity: rand(1..5),
        user_id: rand(1..20),
        concert_id: rand(1..50)
    )
end



puts "Data seed complete."