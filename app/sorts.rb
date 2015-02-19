# https://github.com/jessesquires/objc-sorts/blob/master/ObjcSorts/sorts.m

def rubymotion_sort(arr)
  arr.sort!
end

def selectionSort(arr)
  minIndex = 0

  i = 0
  while i < arr.count
    minIndex = i

    j = i + 1
    while j < arr.count
      minIndex = j if arr[j] < arr[minIndex]
      j += 1
    end

    if minIndex != i
      swap = arr[i]
      arr[i] = arr[minIndex]
      arr[minIndex] = swap
    end
    i += 1
  end
end

def insertionSort(arr)
  i = 1
  while i < arr.count
    j = i
    target = arr[i]

    while (j > 0 && target < arr[j - 1])
      swap = arr[j]
      arr[j] = arr[j - 1]
      arr[j - 1] = swap
      j -= 1
    end
    arr[j] = target
    i += 1
  end
end

def partition(arr, left, right)
  i = left
  j = right
  pivot = arr[(left + right) / 2]

  while i <= j
    i += 1 while arr[i] < pivot

    j -= 1 while (j > 0 && arr.objectAtIndex(j) > pivot)

    if i <= j
      swap = arr[i]
      arr[i] = arr[j]
      arr[j] = swap

      i += 1

      j -= 1 if j > 0
    end
  end
  i
end

def merge(arr, first, mid, last)
  tempArr = []
  indexA = first
  indexB = mid

  while (indexA < mid && indexB < last)
    numA = arr[indexA]
    numB = arr[indexB]

    if (numA < numB)
      tempArr << numA
      indexA += 1
    else
      tempArr << numB
      indexB += 1
    end
  end

  while (indexA < mid)
    tempArr << arr[indexA]
    indexA += 1
  end

  while (indexB < last)
    tempArr << arr[indexB]
    indexB += 1
  end

  indexA = first

  i = 0
  while i < tempArr.count
    arr[indexA] = tempArr[i]
    indexA += 1
    i += 1
  end

end

def merge_sort(arr, first, last)
  if (first + 1 < last)
    mid = (first + last) / 2
    merge_sort(arr, first, mid)
    merge_sort(arr, mid, last)
    merge(arr, first, mid, last)
  end
end

def mergeSort(arr)
  merge_sort(arr, 0, arr.count)
end

def quick_sort(arr, left, right)
  index = partition(arr, left, right)

  if (left < index - 1)
    quick_sort(arr, left, index - 1)
  end

  if (index < right)
    quick_sort(arr, index, right)
  end
end

def quickSort(arr)
  quick_sort(arr, 0, arr.count - 1)
end

def sift_down(arr, start, stop)
  root = start

  while root * 2 + 1 <= stop
    child = root * 2 + 1
    child += 1 if child + 1 <= stop && arr[child] < arr[child + 1]

    return unless arr[root] < arr[child]

    swap = arr[root]
    arr[root] = arr[child]
    arr[child] = swap

    root = child
  end
end

def heapify(arr, count)
  start = (count - 2) / 2

  while start >= 0
    sift_down(arr, start, count - 1)
    start -= 1
  end
end

def heapSort(arr)
  heapify(arr, arr.count)

  stop = arr.count - 1

  while stop > 0
    swap = arr[stop]
    arr[stop] = arr[0]
    arr[0] = swap

    sift_down(arr, 0, stop - 1)
    stop -= 1
  end
end

def bubbleSort(arr)
  swapped = true
  k = 0

  while (swapped)
    swapped = false

    i = 0
    while i < arr.count - 1 - k
      if (arr[i] > arr[i + 1])
        swap = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = swap

        swapped = true
      end
      i += 1
    end
    k += 1
  end
end
