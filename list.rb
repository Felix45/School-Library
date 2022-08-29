require_relative 'helpers'

class List
  def self.list_people(people)
    puts
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def self.list_books(books)
    puts
    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def self.list_rentals(people)
    puts
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = Finder.find(people, person_id)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
