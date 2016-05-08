# THESE METHODS ARE 'DESTRUCTIVE' to source array

def bubble_sort array

  bubble_sort_by(array) { |left, right| left - right }

  array
end

def bubble_sort_by array, &block

  (array.length).times do
    array.each_with_index do |value, index|
      # checks if next element in array exists, and
      # if code block returns number greater than 0 (which
      # implies that the list is still unsorted)
      if array[index+1] && yield(array[index], array[index+1]) > 0
        array[index], array[index+1] = array[index+1], array[index]
      end
    end
  end

  array
end