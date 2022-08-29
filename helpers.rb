class Finder
  def Finder.find(haystack, key)
    haystack.each do |item|
      return item if item.id == key
    end
  end
end
