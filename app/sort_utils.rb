UINT32_MAX = 0xffffffff

def assert(test, msg="Assertation failed")
  abort msg unless test
end

def arrayIsSorted(arr)
  for i in 0..(arr.count - 1)
    return false if arr[i] < arr[i + 1]
  end
  return true
end

def randomIntegerArray(count)
  NSLog("Generating array of %ld random integers in range [0, %u)...", count, UINT32_MAX)

  arr = NSMutableArray.alloc.initWithCapacity(count)

  for i in 0..count
    number = NSNumber.numberWithInteger(rand(UINT32_MAX))
    arr.addObject(number)
  end

  assert(!arrayIsSorted(arr))
  return arr
end

def sortAlgorithmNameForType(type)
  case type
  when :objective_c then "Objective-C"
  when :quick       then "Quick"
  when :heap        then "Heap"
  when :insertion   then "Insertion"
  when :selection   then "Selection"
  when :merge       then "Merge"
  when :bubble      then "Bubble"
  end
end

def sortArrayWithNameUsingBlock(anArray, sortType, sortBlock)
  puts "sortArrayWithNameUsingBlock"
  arrCopy = anArray.mutableCopy
  NSLog("Running %@...", sortAlgorithmNameForType(sortType))
  startTime = NSDate.date
  sortBlock.call(arrCopy)
  NSTimeInterval totalTime = startTime.timeIntervalSinceNow * -1
  assert(arrayIsSorted(arrCopy))
  NSLog("%@ finished in %lf sec\n", sortAlgorithmNameForType(sortType), totalTime)
  return totalTime
end
