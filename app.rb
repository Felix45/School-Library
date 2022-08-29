require_relative 'creator'

class App
  def initialize
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
      List.list_books(@books)
    when 2
      List.list_people(@people)
    when 3
      create_person
    when 4
      Create.create_book(@books)
    when 5
      Create.create_rental(@people, @books)
    when 6
      List.list_rentals(@people)
    end
  end

  def run
    choice = 0
    while choice != 7
      menu
      puts
      print '[Enter 1-7] '
      choice = gets.chomp.strip.to_i
      check(choice)
      puts
    end
  end

  def create_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.strip.to_i
    case choice
    when 1
      Create.create_student(@people)
    when 2
      Create.create_teacher(@people)
    end
  end
end
