# https://github.com/jessesquires/objc-sorts/blob/master/ObjcSorts/main.m

MAX_COUNT = 10000
NUM_TRIALS = 10.0

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    averageSortTimes = {
      rubymotion:   0.0,
      quick:        0.0,
      heap:         0.0,
      insertion:    0.0,
      selection:    0.0,
      merge:        0.0,
      bubble:       0.0,
    }

    for t in 1..NUM_TRIALS
      puts("\n\n::: TRIAL #{t} :::")

      unsortedArray = randomIntegerArray(MAX_COUNT)

      for sort in averageSortTimes.keys
        sortTime = 0.0

        case (sort)
        when :rubymotion
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            rubymotion_sort(arr)
          })

        when :quick
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            quickSort(arr)
          })

        when :heap
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            heapSort(arr)
          })

        when :insertion
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            insertionSort(arr)
          })

        when :selection
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            selectionSort(arr)
          })

        when :merge
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            mergeSort(arr)
          })

        when :bubble
          sortTime = sortArrayWithNameUsingBlock(unsortedArray, sort, ->(arr) {
            bubbleSort(arr)
          })
        else
          puts sort
        end

        totalTime = averageSortTimes.objectForKey(sort)
        averageSortTimes.setObject(totalTime + sortTime, forKey:sort)
      end
    end

    NSLog("\n\nFinal Results:\n--------------")

    averageSortTimes.enumerateKeysAndObjectsUsingBlock(->(sort, time, stop) {
      puts("#{sortAlgorithmNameForType(sort)} sort average time = #{time / NUM_TRIALS} sec")
    })

    NSLog("\n")
    puts "Test complete."
    true
  end
end
