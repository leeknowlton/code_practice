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

  end
end

a = [1,2,10,4,5]
h = { "a" => 100, "b" => 200, "c" => 300 }

# my_select
  a.my_select do |i, index|
    puts i
    puts index
  end

  h.my_select do |i, index|
    puts i
    puts index
  end


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
