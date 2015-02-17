# https://github.com/jessesquires/objc-sorts/blob/master/ObjcSorts/main.m

MAX_COUNT = 10_000
NUM_TRIALS = 10

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    sortAlgorithms = [
      :objective_c,
      :quick,
      :heap,
      :insertion,
      :selection,
      :merge,
      :bubble,
    ]

    averageSortTimes = NSMutableDictionary.dictionaryWithObjects([ (0.0), (0.0), (0.0), (0.0), (0.0), (0.0), (0.0) ], forKeys:sortAlgorithms)

    for t in 1..NUM_TRIALS
      NSLog("\n\n::: TRIAL %ld :::", t)

      unsortedArray = randomIntegerArray(MAX_COUNT)

      for sort in sortAlgorithms
        sortType = sort.integerValue

        sortTime = 0.0

        case (sortType)
          when :objective_c
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              objcSort(arr)
            })

          when :quick
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              quickSort(arr)
            })

          when :heap
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              heapSort(arr)
            })

          when :insertion
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              insertionSort(arr)
            })

          when :selection
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              selectionSort(arr)
            })

          when :merge
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              mergeSort(arr)
            })

          when :bubble
            sortTime = sortArrayWithNameUsingBlock(unsortedArray, sortType, ->(arr) {
              bubbleSort(arr)
            })
        end

        totalTime = averageSortTimes.objectForKey(sort).doubleValue
        averageSortTimes.setObject(totalTime + sortTime, forKey:sort)
      end
    end

    NSLog("\n\nFinal Results:\n--------------")

    averageSortTimes.enumerateKeysAndObjectsUsingBlock(->(sortType, time, stop) {
      NSLog("%@ sort average time = %lf sec", sortAlgorithmNameForType(sortType.integerValue), time.doubleValue / NUM_TRIALS)
    })

    NSLog("\n")
    puts "Test complete."
    true
  end
end
