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
end
