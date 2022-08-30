require 'json'

class Database
  def self.save(books, persons, rentals)
    self.save_books(books)
    self.save_people(persons)
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
end