require_relative 'book'
require_relative 'list'
require_relative 'student'
require_relative 'teacher'

class Create
  def self.create_book(books)
    puts
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    books.push(Book.new(title, author))
  end

  def self.create_student(people)
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please input a valid age: (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    people << Student.new(age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def self.create_teacher(people)
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 100
      print 'Please input a valid age (1 - 100): '
      age = gets.chomp.strip.to_i
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip
    people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def self.create_rental(people, books)
    puts
    puts 'Select a book from the following list by number'
    List.list_books(books)
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= books.length
      print "Please enter a number within 0 - #{books.length - 1} range: "
      book_choice = gets.chomp.to_i
    end
    book = books[book_choice]
    puts 'Select a person from the following list by number (not id)'
    List.list_people(people)
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= people.length
      print "Please enter a number within 0 - #{people.length - 1} range: "
      person_choice = gets.chomp.to_i
    end
    person = people[person_choice]
    print 'Enter date of booking: (yyyy/mm/dd) : '
    date = gets.chomp.strip
    person.add_rental(date, book)
  end
end
