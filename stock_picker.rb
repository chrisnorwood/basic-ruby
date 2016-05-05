def stock_picker stock_prices
  buy_day, sell_day, max_profit = 0, 0, 0
  total_days                    = stock_prices.size
  best_days                     = []                  # [Buy, Sell]

  stock_prices.each_with_index do |price, index|
    # Declare intial compare day, so
    # while loop will only check following days
    compare_day = index;

    # Run if this price hasn't been compared to all later dates
    while compare_day < total_days
      profit = stock_prices[compare_day] - price

      if profit > max_profit
        buy_day    = index
        sell_day   = compare_day
        max_profit = profit
      end

      # Increase to compare stock against following day
      compare_day += 1
    end
  end

  best_days << buy_day
  best_days << sell_day

  best_days
end