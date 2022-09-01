require '../classroom'
require '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Ruby')
  end

  context 'classroom should have correct details' do
    it 'classroom should have label set to "Ruby"' do
      expect(@classroom.label).to eq 'Ruby'
      expect(@classroom.students.length).to eq(0)
    end
  end

  context 'when adding student to classsroom' do
    it 'student should be added to class' do
      @classroom.add_student(Student.new(14, nil, 'John'))
      expect(@classroom.students.length).to eq(1)
    end
  end
end
