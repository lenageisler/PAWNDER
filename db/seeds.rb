# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Dog.destroy_all
Preference.destroy_all
Favorite.destroy_all
Chat.destroy_all
Message.destroy_all
AiChat.destroy_all
AiMessage.destroy_all

puts "creating 2 shelter users with dogs"

shelter_be = User.create!(
  email: "shelter@shelter.be",
  password: "shelter@shelter.be",
  name: "Chaîne Bleue Mondiale",
  shelter_type: "International Rescue",
  location: "Av. de Visé 39, 1170 Watermael-Boitsfort, BE"
)

shelter_be.dogs.create!(
  name: "Buddy",
  birthday: Date.new(2021, 5, 14),
  age: 3,
  gender: "male",
  neutered: true,
  breed_grade: "Mix",
  breed_category: "Herding-type",
  main_breed: "Border Collie",
  breed_mix: "Border Collie / Labrador / others",
  shoulder_height: 50,
  weight: 20.5,
  in_shelter_since: Date.new(2023, 8, 1),
  location: "Overseas",
  chipped: true,
  health_issus: false,
  list_dog: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "unknown",
  kids_compatible: "yes",
  ideal_evironment: "House with garden",
  info: "Playful and intelligent, loves agility training."
)

shelter_be.dogs.create!(
  name: "Luna",
  birthday: Date.new(2020, 2, 2),
  age: 4,
  gender: "female",
  neutered: false,
  breed_grade: "Hybrid",
  breed_category: "Small & fluffy",
  main_breed: "Poodle",
  breed_mix: "Poodle / Spaniel",
  shoulder_height: 40,
  weight: 12.0,
  location: "Foster Care",
  chipped: true,
  health_issus: true,
  health_issus_details: "Allergy requires special food",
  list_dog: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "no",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_evironment: "Quiet environment",
  info: "Gentle and affectionate, needs calm environment."
)

shelter_be.dogs.create!(
  name: "Max",
  birthday: Date.new(2018, 11, 11),
  age: 6,
  gender: "male",
  neutered: true,
  breed_grade: "Pure breed",
  breed_category: "Shepherd-type",
  main_breed: "German Shepherd",
  shoulder_height: 65,
  weight: 32.0,
  location: "Overseas",
  chipped: false,
  health_issus: false,
  list_dog: true,
  beginner_friendly: false,
  male_compatible: "no",
  female_compatible: "yes",
  cat_compatible: "no",
  kids_compatible: "unknown",
  ideal_evironment: "Countryside",
  info: "Strong and loyal, trained in basic obedience."
)

shelter_de = User.create!(
  email: "test@test.de",
  password: "test@test.de",
  name: "Kölner Tierschutzverein",
  shelter_type: "Dog Shelter",
  location: "Vorgebirgstraße 76, 50969 Köln, DE"
)

shelter_de.dogs.create!(
  name: "Bella",
  age: 2,
  gender: "female",
  neutered: false,
  breed_grade: "Pure breed",
  breed_category: "Retriever-type",
  main_breed: "Golden Retriever",
  shoulder_height: 55,
  weight: 28.0,
  in_shelter_since: Date.new(2024, 5, 10),
  location: "Shelter",
  chipped: true,
  health_issus: false,
  list_dog: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_evironment: "House with garden",
  info: "Sweet and loyal, perfect family dog."
)

shelter_de.dogs.create!(
  name: "Rocky",
  age: 5,
  gender: "male",
  neutered: true,
  breed_grade: "Mix",
  breed_category: "Terrier-type",
  main_breed: "Jack Russell Terrier",
  breed_mix: "Jack Russell / unknown",
  shoulder_height: 35,
  weight: 9.5,
  in_shelter_since: Date.new(2023, 3, 2),
  location: "Shelter",
  chipped: true,
  health_issus: false,
  list_dog: false,
  beginner_friendly: false,
  male_compatible: "no",
  female_compatible: "yes",
  cat_compatible: "no",
  kids_compatible: "unknown",
  ideal_evironment: "City life",
  info: "Energetic and clever, needs an active handler."
)

shelter_de.dogs.create!(
  name: "Milo",
  age: 1,
  gender: "male",
  neutered: false,
  breed_grade: "Mix",
  breed_category: "Small mixed",
  main_breed: "Unknown",
  shoulder_height: 30,
  weight: 6.8,
  in_shelter_since: Date.new(2024, 7, 15),
  location: "Shelter",
  chipped: false,
  health_issus: false,
  list_dog: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_evironment: "Apartment-friendly",
  info: "Young and curious, still learning the basics."
)

shelter_de.dogs.create!(
  name: "Nala",
  birthday: Date.new(2019, 9, 30),
  age: 5,
  gender: "female",
  neutered: true,
  breed_grade: "Hybrid",
  breed_category: "Sporty-Hunting-type",
  main_breed: "Pointer",
  breed_mix: "Pointer / Weimaraner",
  shoulder_height: 52,
  weight: 19.0,
  in_shelter_since: Date.new(2024, 2, 18),
  location: "Shelter",
  chipped: true,
  health_issus: true,
  health_issus_details: "Minor hip dysplasia",
  list_dog: false,
  beginner_friendly: false,
  male_compatible: "yes",
  female_compatible: "unknown",
  cat_compatible: "no",
  kids_compatible: "yes",
  ideal_evironment: "Countryside",
  info: "Athletic and affectionate, loves long walks."
)

shelter_de.dogs.create!(
  name: "Charlie",
  age: 7,
  gender: "male",
  neutered: true,
  breed_grade: "Mix",
  breed_category: "Big gentle",
  main_breed: "Bernese Mountain Dog",
  shoulder_height: 68,
  weight: 40.0,
  in_shelter_since: Date.new(2021, 11, 25),
  location: "Shelter",
  chipped: true,
  health_issus: false,
  list_dog: false,
  beginner_friendly: true,
  male_compatible: "unknown",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_evironment: "Quiet environment",
  info: "Calm and loving, enjoys relaxing with people."
)

puts "seeding shelters and dogs done"
puts "creating 3 searchers with preferences"

searcher1 = User.create!(
  email: "anna@anna.com",
  password: "anna@anna.com",
  role: "searcher",
  username: "Anna"
)

searcher1.preferences.create!(
  age: 5,
  gender: "female",
  breed_grade: "Mix",
  breed_category: "Small & fluffy",
  ideal_evironment: "Apartment-friendly"
)

searcher2 = User.create!(
  email: "danny@danny.com",
  password: "danny@danny.com",
  role: "searcher",
  username: "Danny"
)

searcher2.preferences.create!(
  age: 1,
  neutered: true,
  location: "Shelter",
  kids_compatible: "yes",
  ideal_evironment: "House with garden"
)

searcher3 = User.create!(
  email: "sophie@sophie.com",
  password: "sophie@sophie.com",
  role: "searcher",
  username: "Sophie"
)

searcher3.preferences.create!(
  breed_grade: "Pure breed",
  breed_category: "Shepherd-type",
  female_compatible: "yes",
  ideal_evironment: "Countryside"
)

puts "seeding searchers done"
puts "seeding done"
