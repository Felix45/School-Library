class Nameable
  def correct_name
    raise NotImplementedError.new('Method should be implemented in concrete class')
  end
end
