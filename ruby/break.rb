class Broken
  def method_missing name
    puts "#{name} not found"
    self.send (name.to_s.to_i + 1).to_s
  end
end

Broken.new.send('1')