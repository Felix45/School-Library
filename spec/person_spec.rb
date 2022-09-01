require '../person'
require '../book'

describe Person do
  before :each do
    @person = Person.new(30, 'Felix Ouma')
  end

  context 'When a new person is created' do
    it 'should have' do
      expect(@person.age).to eq 30
      expect(@person.name).to eq 'Felix Ouma'
      expect(@person.rentals).to eq []
      expect(@person.can_use_services?).to eq true
    end
  end

  context 'when a person rents out a book' do
    it 'should have' do
      @person.add_rental('2022/08/30', Book.new('C++ programming', 'John B. Thomas'))
      @person.add_rental('2022/08/31', Book.new('Algorithms in Ruby', 'Roberto Tammasia'))
      expect(@person.rentals.length).to be 2
      expect(@person.rentals[0].book.title).to eq 'C++ programming'
      expect(@person.rentals[1].book.title).to eq 'Algorithms in Ruby'
    end
  end

  context 'when a person is created with a different name' do
    it 'should return the name in constructor' do
      person = Person.new(45, 'Argwings Kodhek')
      expect(person.correct_name).to eq 'Argwings Kodhek'
    end
  end

  context 'when a person is created it' do
    it 'should be able to use services' do
      person = Person.new(45, 'Kijana Wamalwa')
      expect(person.can_use_services?).to be true
    end
  end

end