# Maybe not the most elegant solution, for loops and changing

def bubble_sort array
  # Iterating through array as many times as its size
  # ensures all big numbers will be "pushed" to the back
  (array.length).times do
    
    # going from index 0 through (array.length-2) means we will 
    # stop comparing "next" value, when "next" is the last element
    for i in 0..array.length-2
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
      end
    end
  end

  array
end