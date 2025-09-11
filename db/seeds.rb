AiMessage.destroy_all
AiChat.destroy_all
Message.destroy_all
Chat.destroy_all
Favorite.destroy_all
Preference.destroy_all
Dog.destroy_all
User.destroy_all

puts "creating 3 shelter users with dogs"

shelter_be = User.create!(
  email: "shelter@shelter.be",
  password: "shelter@shelter.be",
  role: "shelter",
  name: "Chaîne Bleue Mondiale",
  shelter_type: "International Rescue",
  location: "Av. de Visé 39, 1170 Watermael-Boitsfort, BE"
)

Dog.create!(
  user: shelter_be,
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
  health_issues: false,
  restricted_breed: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "unknown",
  kids_compatible: "yes",
  ideal_environment: "House with garden",
  info: "Playful and intelligent, loves agility training."
)

Dog.create!(
  user: shelter_be,
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
  health_issues: true,
  health_issues_details: "Allergy requires special food",
  restricted_breed: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "no",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_environment: "Quiet environment",
  info: "Gentle and affectionate, needs calm environment."
)

Dog.create!(
  user: shelter_be,
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
  health_issues: false,
  restricted_breed: true,
  beginner_friendly: false,
  male_compatible: "no",
  female_compatible: "yes",
  cat_compatible: "no",
  kids_compatible: "unknown",
  ideal_environment: "Countryside",
  info: "Strong and loyal, trained in basic obedience."
)

shelter_de = User.create!(
  email: "test@test.de",
  password: "test@test.de",
  role: "shelter",
  name: "Kölner Tierschutzverein",
  shelter_type: "Dog Shelter",
  location: "Vorgebirgstraße 76, 50969 Köln, DE"
)

Dog.create!(
  user: shelter_de,
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
  health_issues: false,
  restricted_breed: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_environment: "House with garden",
  info: "Sweet and loyal, perfect family dog."
)

Dog.create!(
  user: shelter_de,
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
  health_issues: false,
  restricted_breed: false,
  beginner_friendly: false,
  male_compatible: "no",
  female_compatible: "yes",
  cat_compatible: "no",
  kids_compatible: "unknown",
  ideal_environment: "City life",
  info: "Energetic and clever, needs an active handler."
)

Dog.create!(
  user: shelter_de,
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
  health_issues: false,
  restricted_breed: false,
  beginner_friendly: true,
  male_compatible: "yes",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_environment: "Apartment-friendly",
  info: "Young and curious, still learning the basics."
)

Dog.create!(
  user: shelter_de,
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
  health_issues: true,
  health_issues_details: "Minor hip dysplasia",
  restricted_breed: false,
  beginner_friendly: false,
  male_compatible: "yes",
  female_compatible: "unknown",
  cat_compatible: "no",
  kids_compatible: "yes",
  ideal_environment: "Countryside",
  info: "Athletic and affectionate, loves long walks."
)

Dog.create!(
  user: shelter_de,
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
  health_issues: false,
  restricted_breed: false,
  beginner_friendly: true,
  male_compatible: "unknown",
  female_compatible: "yes",
  cat_compatible: "yes",
  kids_compatible: "yes",
  ideal_environment: "Quiet environment",
  info: "Calm and loving, enjoys relaxing with people."
)

shelter_uk = User.create!(
  email: "info@londondogshelter.org",
  password: "info@londondogshelter.org",
  role: "shelter",
  name: "London Dog Rescue",
  shelter_type: "International Rescue",
  location: "123 Battersea Park Road, London SW11 4LR, UK"
)

dog_data_uk = [
  { name: "Simba", age: 2, gender: "male", main_breed: "Shiba Inu", breed_category: "Spitz-type", weight: 12.0, info: "Alert and curious, loves exploring." },
  { name: "Ruby", age: 4, gender: "female", main_breed: "Beagle", breed_category: "Hound-type", weight: 14.0, info: "Friendly and food-driven, loves sniffing games." },
  { name: "Oscar", age: 6, gender: "male", main_breed: "Bulldog", breed_category: "Big gentle", weight: 24.0, info: "Gentle couch potato, needs short walks." },
  { name: "Maya", age: 1, gender: "female", main_breed: "Cocker Spaniel", breed_category: "Small & fluffy", weight: 10.0, info: "Playful, loves people and other dogs." },
  { name: "Diesel", age: 3, gender: "male", main_breed: "Rottweiler", breed_category: "Big gentle", weight: 40.0, info: "Strong and protective, needs experienced handler." },
  { name: "Snoopy", age: 5, gender: "male", main_breed: "Basset Hound", breed_category: "Hound-type", weight: 20.0, info: "Calm and affectionate, loves long naps." },
  { name: "Chloe", age: 7, gender: "female", main_breed: "Labrador Retriever", breed_category: "Retriever-type", weight: 28.0, info: "Family dog, friendly with kids." },
]

dog_data_be = [
  { name: "Poppy", age: 5, gender: "female", main_breed: "West Highland White Terrier", breed_category: "Terrier-type", weight: 8.0, info: "Lively and independent, but very affectionate." },
  { name: "Archie", age: 2, gender: "male", main_breed: "Cavapoo", breed_category: "Small & fluffy", weight: 7.0, info: "Sociable and playful, perfect city dog." },
  { name: "Lola", age: 6, gender: "female", main_breed: "Greyhound", breed_category: "Hound-type", weight: 27.0, info: "Calm at home, loves daily sprints." },
  { name: "Finn", age: 4, gender: "male", main_breed: "Staffordshire Bull Terrier", breed_category: "Big gentle", weight: 18.0, info: "Friendly and energetic, loves tug-of-war." },
  { name: "Hazel", age: 3, gender: "female", main_breed: "Border Terrier", breed_category: "Terrier-type", weight: 7.5, info: "Curious and brave, loves chasing balls." },
  { name: "Theo", age: 1, gender: "male", main_breed: "Cockapoo", breed_category: "Small & fluffy", weight: 9.0, info: "Cheeky and affectionate, loves cuddles." },
  { name: "Molly", age: 9, gender: "female", main_breed: "King Charles Cavalier", breed_category: "Small & fluffy", weight: 6.5, info: "Calm senior, enjoys gentle walks." },
]

dog_data_de = [
  { name: "Rex", age: 8, gender: "male", main_breed: "Doberman", breed_category: "Shepherd-type", weight: 36.0, info: "Loyal and protective, needs space to run." },
  { name: "Daisy", age: 2, gender: "female", main_breed: "Whippet", breed_category: "Hound-type", weight: 12.0, info: "Elegant and fast, loves sprinting outdoors." },
  { name: "Shadow", age: 3, gender: "male", main_breed: "Mixed", breed_category: "Medium mixed", weight: 18.0, info: "Quiet and shy, bonds deeply once he trusts." },
  { name: "Leo", age: 2, gender: "male", main_breed: "German Shorthaired Pointer", breed_category: "Sporty-Hunting-type", weight: 25.0, info: "Energetic, loves outdoor adventures." },
  { name: "Rosie", age: 5, gender: "female", main_breed: "Samoyed", breed_category: "Spitz-type", weight: 23.0, info: "Fluffy and friendly, loves cold weather." },
  { name: "Baxter", age: 7, gender: "male", main_breed: "Great Dane", breed_category: "Big gentle", weight: 50.0, info: "Gentle giant, needs space to stretch out." }
]

dog_data_uk.each_with_index do |dog, i|
  Dog.create!(
    user: shelter_uk,
    name: dog[:name],
    age: dog[:age],
    gender: dog[:gender],
    neutered: [true, false].sample,
    breed_grade: ["Pure breed", "Mix", "Hybrid"].sample,
    breed_category: dog[:breed_category],
    main_breed: dog[:main_breed],
    shoulder_height: rand(25..70),
    weight: dog[:weight],
    in_shelter_since: Date.today - rand(30..600),
    location: "Shelter",
    chipped: [true, false].sample,
    health_issues: [true, false].sample,
    restricted_breed: [true, false].sample,
    beginner_friendly: [true, false].sample,
    male_compatible: %w[yes no unknown].sample,
    female_compatible: %w[yes no unknown].sample,
    cat_compatible: %w[yes no unknown].sample,
    kids_compatible: %w[yes no unknown].sample,
    ideal_environment: ["Apartment-friendly", "House with garden", "Countryside"].sample,
    info: dog[:info]
  )
end

dog_data_be.each_with_index do |dog, i|
  Dog.create!(
    user: shelter_be,
    name: dog[:name],
    age: dog[:age],
    gender: dog[:gender],
    neutered: [true, false].sample,
    breed_grade: ["Pure breed", "Mix", "Hybrid"].sample,
    breed_category: dog[:breed_category],
    main_breed: dog[:main_breed],
    shoulder_height: rand(25..70),
    weight: dog[:weight],
    in_shelter_since: Date.today - rand(30..600),
    location: "Shelter",
    chipped: [true, false].sample,
    health_issues: [true, false].sample,
    restricted_breed: [true, false].sample,
    beginner_friendly: [true, false].sample,
    male_compatible: %w[yes no unknown].sample,
    female_compatible: %w[yes no unknown].sample,
    cat_compatible: %w[yes no unknown].sample,
    kids_compatible: %w[yes no unknown].sample,
    ideal_environment: ["Apartment-friendly", "House with garden", "Countryside"].sample,
    info: dog[:info]
  )
end

dog_data_de.each_with_index do |dog, i|
  Dog.create!(
    user: shelter_de,
    name: dog[:name],
    age: dog[:age],
    gender: dog[:gender],
    neutered: [true, false].sample,
    breed_grade: ["Pure breed", "Mix", "Hybrid"].sample,
    breed_category: dog[:breed_category],
    main_breed: dog[:main_breed],
    shoulder_height: rand(25..70),
    weight: dog[:weight],
    in_shelter_since: Date.today - rand(30..600),
    location: "Shelter",
    chipped: [true, false].sample,
    health_issues: [true, false].sample,
    restricted_breed: [true, false].sample,
    beginner_friendly: [true, false].sample,
    male_compatible: %w[yes no unknown].sample,
    female_compatible: %w[yes no unknown].sample,
    cat_compatible: %w[yes no unknown].sample,
    kids_compatible: %w[yes no unknown].sample,
    ideal_environment: ["Apartment-friendly", "House with garden", "Countryside"].sample,
    info: dog[:info]
  )
end

puts "seeding shelters and dogs done"

puts "creating 3 searchers with preferences"

searcher1 = User.create!(
  email: "anna@anna.com",
  password: "anna@anna.com",
  role: "searcher",
  username: "Anna"
)

Preference.create!(
  user: searcher1,
  age_min: 5,
  gender: "female",
  breed_grade: ["Mix"],
  breed_category: ["Small & fluffy"],
)

searcher2 = User.create!(
  email: "danny@danny.com",
  password: "danny@danny.com",
  role: "searcher",
  username: "Danny"
)

Preference.create!(
  user: searcher2,
  kids_compatible: "true",
  ideal_environment: ["House with garden"]
)

searcher3 = User.create!(
  email: "sophie@sophie.com",
  password: "sophie@sophie.com",
  role: "searcher",
  username: "Sophie"
)

Preference.create!(
  user: searcher3,
  breed_grade: ["Pure breed"],
  female_compatible: "true",
  ideal_environment: ["Countryside"]
)

puts "seeding searchers done"
puts "seeding done"
