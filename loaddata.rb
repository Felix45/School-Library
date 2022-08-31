require 'json'

class LoadData
  def self.load_books
    books = []
    records = JSON.parse(File.read('./data/books.json'));
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end
end