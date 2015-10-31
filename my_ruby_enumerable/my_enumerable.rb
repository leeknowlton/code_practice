module Enumerable
    
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    index = 0
    self.my_each do |i| 
      yield(i, index)
      index += 1
    end
  end

  def my_select
    return self unless block_given?
    self.my_each do |i|
      yield(i)
    end
  end

  def my_all?
    self.my_each{ |i| return false unless yield(i) == true}
    true
  end

  def my_any?
    self.my_each{ |i| return true if yield(i) == true}
    false
  end

  def my_none?
    self.my_each{ |i| return false if yield(i) == true}
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |i| count +=1 if (yield(i) == true)}
    else
      self.my_each { |i| count += 1 }
    end
    count
  end

  def my_map  
    output = []
    return self unless block_given?
    self.my_each { |i| output << (yield(i))}
    output
  end

  def my_inject(num=nil)
    
    num == nil ? total = self.first : total = num
    
    self.my_each do |i|
      total = (yield(total, i))
    end
    total  
  end
end

a = [1,2,10,4,5]
e = [2,4,6]
h = { "a" => 100, "b" => 200, "c" => 300 }

# my_map
# puts (1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
# puts (1..4).map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

#my_count
  # puts a.my_count {|num| num.even?}
  # puts a.my_count {|num| num.odd?}
  # puts h.my_count

#my_none?
  # puts a.my_none? {|num| num.even?}
  # puts e.my_none? {|num| num.odd?}
  # puts h.my_none? {|k,v| k > "a"}

#my_any?
  # puts a.my_any? {|num| num.even?}
  # puts e.my_any? {|num| num.odd?}
  # puts h.my_any? {|k,v| k > "a"}

# #my_all?
#   puts a.my_all? {|num| num.even?}
#   puts e.my_all? {|num| num.even?}
#   puts h.my_all? {|k,v| k > "a"}


#my_select

  # puts a.select {|num| num.even?}
  # puts h.select {|k,v| k > "a"}


# my_each_with_index
  # a.my_each_with_index do |i, index|
  #   puts i
  #   puts index
  # end

  # h.my_each_with_index do |i, index|
  #   puts i
  #   puts index
  # end

# my_each
  # a.my_each do |i|
  #   puts i
  # end

  # h.my_each do |k,v|
  #   puts k
  #   puts v
  # end
