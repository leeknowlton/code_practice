def bubble_sort a
  loop do
    swapped = false
      (a.length - 1).times do |i|
        x = a[i]
        y = a[i+1]
        if x > y
          a[i+1] = x
          a[i] = y
          swapped = true
        end
      end  
    return a if swapped == false
  end
end

def bubble_sort_by a
  comp = yield a if block_given?
  loop do
    swapped = false
      (a.length - 1).times do |i|
        x = a[i]
        y = a[i+1]
        if (yield(x, y) > 0)
          a[i+1] = x
          a[i] = y
          swapped = true
        end
      end  
    return a if swapped == false
  end
end

bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

puts bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }
# => ["hi", "hey", "hello"]