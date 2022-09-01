require '../book'
require '../student'

describe Book do
  before :each do
    @book = Book.new('Think Big', 'Ben Carson')
  end
  context 'book with correct details' do
    it 'book should have title: Think Big, author: Ben Carson' do
      expect(@book.title).to eq('Think Big')
      expect(@book.author).to eq('Ben Carson')
      expect(@book.rentals).to eq []
    end
  end

  context 'Book rented out, ' do
    it 'adding one rental to book should have length of one' do
      @book.add_rental('2022/08/30', Student.new(20, nil, 'Felix Ouma'))
      expect(@book.rentals.length).to eq(1)
    end
  end
end
