UINT32_MAX = 0xffffffff

def assert(test, msg="Assertation failed")
  abort msg unless test
end

def arrayIsSorted(arr)
  arr == arr.sort
end

def randomIntegerArray(count)
  puts("Generating array of #{count} random integers in range [0, #{UINT32_MAX})...")

  arr = Array.new(count)

  for i in 0..(count - 1)
    number = NSNumber.numberWithInteger(rand(UINT32_MAX))
    arr << number
  end

  assert !arrayIsSorted(arr)
  return arr
end

def sortAlgorithmNameForType(type)
  case type
  when :rubymotion  then "RubyMotion"
  when :quick       then "Quick     "
  when :heap        then "Heap      "
  when :insertion   then "Insertion "
  when :selection   then "Selection "
  when :merge       then "Merge     "
  when :bubble      then "Bubble    "
  end
end

def sortArrayWithNameUsingBlock(anArray, sortType, sortBlock)
  arrCopy = anArray.mutableCopy
  print "Running #{sortAlgorithmNameForType(sortType)}..."
  startTime = NSDate.date
  sortBlock.call(arrCopy)
  totalTime = startTime.timeIntervalSinceNow * -1.0
  assert arrayIsSorted(arrCopy)
  assert totalTime > 0.0
  puts "\t\tfinished in #{totalTime} sec"
  return totalTime
end
