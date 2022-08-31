require 'json'

class Database
  def self.save(books, persons, rentals)
    self.save_books(books)
    self.save_people(persons)
    self.save_rentals(rentals)
  end

  def self.save_books(books)
    records = []
    books.each { | book | records << { title: book.title, author: book.author } }
    File.write('./data/books.json', JSON.generate(records));
  end

  def self.save_people(people)
    records = []
    people.each do | person |
      records << {
      id: person.id,
      type: person.class,
      name: person.name,
      age: person.age,
      parent_permission: person.can_use_services?
    }
    end
    File.write('./data/people.json', JSON.generate(records));
  end

  def self.save_rentals(rentals)
    records = []
    rentals.each do | rental |
      records << {
        date: rental.date,
        person_id: rental.person.id,
        person_name: rental.person.name,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./data/rentals.json', JSON.generate(records));
  end
end