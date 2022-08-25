require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def check(choice)
    case choice
    when 1
      list_books
    when 3
      create_person
    when 4
      add_book
    end
  end

  def run
    choice = 0
    while choice != 7
      menu()
      choice = gets.chomp.strip.to_i
      check(choice)
      puts
    end
  end


  def add_book
    print "Title: "
    title = gets.chomp.strip.capitalize
    print "Author: "
    author = gets.chomp.strip.capitalize
    @books.push(Book.new(title, author))
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\" Author: #{book.author}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.strip.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_teacher
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
    @people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def create_student
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
    @people << Student.new(age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
  end
end
