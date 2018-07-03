module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each do |row|
        data = @headers.zip(row)
        hash = Hash[data]
        yield CsvRow.new(hash)
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

  end
end

class CsvRow
  def initialize(data_hash)
    @data = data_hash
  end
  def method_missing name, *args
    @data[name.to_s]
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each do |row|
  puts row.one
end