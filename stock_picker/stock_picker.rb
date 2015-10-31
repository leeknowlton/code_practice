def stock_picker stock_prices
  profit = 0
  buy_day = 0
  sell_day = 0

  stock_prices.each_with_index do |price, i|
    buy_price = price
    j = i+1
    while j < stock_prices.length 
      sell_price = stock_prices[j]
      if (sell_price - buy_price) > profit
        profit = sell_price - buy_price
        buy_day = i
        sell_day = j
      end
      j += 1
    end
  end
  puts "It's best to buy on day #{buy_day + 1} and sell on day #{sell_day + 1} for a profit of $#{profit}."
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
