# Clear all data from tables except for users
ListPlace.destroy_all
Pin.destroy_all
PlaceCategory.destroy_all
List.destroy_all
Location.destroy_all
Place.destroy_all
Category.destroy_all

# Reset primary key sequences
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Locations
Location.create(city: 'Paris', country: 'France', latitude: 48.8566, longitude: 2.3522, image: 'https://www.yourimage.com/paris.jpg')

# Places
Place.create(google_id: 'ChIJD7fiBh9u5kcRYJSMaMOCCwQ', name: 'Eiffel Tower', formatted_address: 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France', formatted_phone_number: '+33 892 70 12 39', location: { 'lat': 48.8584, 'lng': 2.2945 }, website: 'https://www.toureiffel.paris/en', rating: '4.6', photo_ref: 'https://www.yourimage.com/eiffel-tower.jpg')

# Categories
Category.create(label: 'Food')

# Lists
List.create(location_id: 1, pinned: 1, user_id: 2)

# ListPlaces
ListPlace.create(list_id: 1, place_id: 1, note: 'A must-visit attraction')

# Pins
Pin.create(user_id: 2, list_id: 1)

# PlaceCategories
PlaceCategory.create(place_id: 1, category_id: 1, list_id: 1, note: 'Great view from the top!')
