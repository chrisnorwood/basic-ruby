module Enumerable
  
  def my_each &block
    return self.to_enum unless block_given?
    # self.size-1 is last index available in input
    for i in 0..(self.size-1)
      yield self[i]
    end

    return self
  end

  def my_each_with_index &block
    # self.size-1 is last index available in input
    for i in 0..(self.size-1)
      yield(self[i], i)
    end

    return self
  end

  def my_select &block
    result = []

    self.my_each { |i| result.push(i) if yield(i) }

    return result
  end

  def my_all? &block
    result = true
    
    if block_given?
      self.my_each { |i| result = false if !yield(i) }
    else
      self.my_each { |i| result = false if i == nil || i == false}
    end

    return result
  end

  def my_any? &block
    result = false
    self.my_each { |i| result = true if yield(i) }

    return result
  end

  def my_none? &block
    result = true
    self.my_each { |i| result = false if yield(i) }

    return result
  end

  def my_count args = false, &block
    count = 0

    if args
      self.my_each { |i| count += 1 if i == args }
    elsif !block_given?
      count = self.length
    else
      self.my_each { |i| count += 1 if yield(i) }
    end

    return count
  end

  def my_map proc = nil, &block
    return self.to_enum unless block_given? || proc

    result = []

    # If both block and proc supplied, apply block to result of proc,
    self.my_each do |i|
      if block_given? && proc
        proc_value = proc.call(i)
        result << yield(proc_value)
      elsif proc
        result << proc.call(i)
      else
        result << yield(i)
      end
    end
    
    return result
  end

  def my_inject args = self[0], &block
    result = args

    self[1..self.length].my_each { |i| result = yield(result, i) }

    return result
  end
    
end


def multiply_els array
  array.my_inject { |product, obj| product * obj }
end