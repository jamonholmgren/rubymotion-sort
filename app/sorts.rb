# https://github.com/jessesquires/objc-sorts/blob/master/ObjcSorts/sorts.m

def rubymotion_sort(arr)
  arr.sort!
end

def selectionSort(arr)
  minIndex = 0

  for i in 0..(arr.count - 1)
    minIndex = i

    for j in (i + 1)..(arr.count - 1)
      if arr[j] < arr[minIndex]
        minIndex = j
      end
    end

    arr[i], arr[minIndex] = arr[minIndex], arr[i] if minIndex != i
  end
end

def insertionSort(arr)
  for i in 1..(arr.count - 1)
    j = i
    target = arr[i]

    while (j > 0 && target < arr[j - 1])
      arr[j], arr[j - 1] = arr[j - 1], arr[j]
      j -= 1
    end
    arr[j] = target
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
      arr[i], arr[j] = arr[j], arr[i]
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
      tempArr.addObject(numA)
      indexA += 1
    else
      tempArr.addObject(numB)
      indexB += 1
    end
  end

  while (indexA < mid)
    tempArr.addObject(arr.objectAtIndex(indexA))
    indexA += 1
  end

  while (indexB < last)
    tempArr.addObject(arr.objectAtIndex(indexB))
    indexB += 1
  end

  indexA = first

  for i in 0..tempArr.count - 1
    arr.replaceObjectAtIndex(indexA, withObject:tempArr.objectAtIndex(i))
    indexA += 1
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

    arr[root], arr[child] = arr[child], arr[root]
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
    arr[stop], arr[0] = arr[0], arr[stop]
    sift_down(arr, 0, stop - 1)
    stop -= 1
  end
end

def bubbleSort(arr)
  swapped = true
  k = 0

  while (swapped)
    swapped = false

    for i in 0..(arr.count - 2 - k)
      if (arr[i] > arr[i + 1])
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    k += 1
  end
end
