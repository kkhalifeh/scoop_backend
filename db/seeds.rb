ListItem.destroy_all
List.destroy_all
Venue.destroy_all
Category.destroy_all
City.destroy_all
User.destroy_all

# Create predefined categories
categories = [
  { name: 'Breakfast' },
  { name: 'Lunch' },
  { name: 'Brunch' },
  { name: 'Apres Ski' },
  { name: 'Dinner' }
]

categories.each do |category|
  Category.create!(category)
end

# Create some predefined cities
cities = [
  { name: 'New York', country: 'USA' },
  { name: 'Paris', country: 'France' },
  { name: 'London', country: 'UK' }
]

cities.each do |city|
  City.create!(city)
end

# Create a sample user
user = User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password',
  username: 'test_user',
  first_name: 'John',
  last_name: 'Doe',
  mobile_number: '1234567890'
)



# Create a sample list for the user
list = user.lists.create!(
  city: City.find_by(name: 'New York')
)

# Create a sample venue
venue = Venue.create!(
  name: 'Central Park',
  address: 'New York, NY',
  google_place_id: 'ChIJ4zGFAZpYwokRGUGph3Mf37k',
  phone_number: '+1 (212) 310-6600',
  website: 'https://www.centralparknyc.org/',
  reservation_url: nil,
  image: 'https://example.com/image.jpg',
  rating: 4.6
)

# Create a sample list item with a category
list_item = list.list_items.create!(
  category: Category.find_by(name: 'Breakfast'),
  venue: venue,
  notes: 'Great place for a morning walk!'
)
