require 'json'

class LoadData
  def self.load_books
    books = []
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
    records = JSON.parse(File.read('./data/books.json'));
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end

  def self.load_people
    people = []
    File.write('./data/people.json', []) unless File.exist?('./data/people.json')
    records = JSON.parse(File.read('./data/people.json'))
    records.each do |record|
      if record['type'] == 'Student'
        person = Student.new(record['age'], nil, record['name'], parent_permission: record['parent_permission'])
      else
        person = Teacher.new(record['age'], '', record['name']);
      end
      person.id = record['id']
      people << person
    end
    people
  end

  def self.load_rentals(books, people)
    rentals = []
    File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
    records = JSON.parse(File.read('./data/rentals.json'))
    records.each do |record|
      book = books.select { |book| book.title == record['title'] }[0]
      person = people.select { |person| person.id == record['person_id'] }[0]
      rental = person.add_rental(record['date'], book)
      rentals << rental
    end
    rentals
  end
end

