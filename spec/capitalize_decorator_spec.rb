require '../capitalize_decorator'
require '../person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(30, 'isaiah Thomas')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end

  context 'when an object of capitalize decorator is created' do
    it 'should have correct type and details' do
      expect(@capitalize_decorator).to be_instance_of CapitalizeDecorator
      expect(@capitalize_decorator).to be_kind_of BaseDecorator
      expect(@capitalize_decorator.correct_name).to eq 'Isaiah thomas'
    end
  end

  context 'when a capitalize_decorator.correct_name is called ' do
    it 'should have correct_name capitalized' do
      @person.name = 'abdulhamid'
      expect(@capitalize_decorator.correct_name).to eq 'Abdulhamid'
    end
  end
end
