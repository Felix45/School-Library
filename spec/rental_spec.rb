require '../rental'
require '../person'
require '../book'

describe Rental do
  before :each do
    @person = Person.new(14, 'John')
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    @rental = Rental.new('2022/08/31', @person, @book)
  end

  context 'rental should have correct details' do
    it 'book and person should contain new item' do
      expect(@rental.date).to eq '2022/08/31'
      expect(@rental.person.rentals.length).to eq(1)
      expect(@rental.book.rentals.length).to eq(1)
    end
  end
end
