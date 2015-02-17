# https://github.com/jessesquires/objc-sorts/blob/master/ObjcSorts/sorts.m

def objcSort(arr)
  puts "objcSort"
  arr.sortUsingComparator ->(n1, n2) {
    n1.compare(n2)
  }
end

def selectionSort(arr)
  puts "selectionSort"
  minIndex = 0

  for i in 0..(arr.count + 1)
    minIndex = i

    for j in (i + 1)..(arr.count)
      if arr.objectAtIndex(j).integerValue < arr.objectAtIndex(minIndex).integerValue
        minIndex = j
      end
    end

    if minIndex != i
      arr.exchangeObjectAtIndex(i, withObjectAtIndex:minIndex)
    end
  end
end

def insertionSort(arr)
  puts "insertionSort"
  for i in 1..(arr.count)
    j = i
    target = arr.objectAtIndex(i)

    while (j > 0 && target.integerValue < arr.objectAtIndex(j.- 1).integerValue)
      arr.exchangeObjectAtIndex(j, withObjectAtIndex:j - 1)
      j -= 1
    end
    arr.replaceObjectAtIndex(j, withObject:target)
  end
end

def partition(arr, left, right)
  puts "partition"
  i = left
  j = right
  pivot = arr.objectAtIndex((left.+ right) / 2).integerValue

  while i <= j
    while arr.objectAtIndex(i).integerValue < pivot
      i += 1
    end

    while (j > 0 && arr.objectAtIndex(j).integerValue > pivot)
      j -= 1
    end

    if (i <= j)
      arr.exchangeObjectAtIndex(i, withObjectAtIndex:j)
      i += 1

      if (j > 0)
        j -= 1
      end
    end
  end
  return i
end

def merge(arr, first, mid, last)
  puts "merge"
  tempArr = NSMutableArray.alloc.init
  indexA = first
  indexB = mid

  while (indexA < mid && indexB < last)
    numA = arr.objectAtIndex(indexA)
    numB = arr.objectAtIndex(indexB)

    if (numA.integerValue < numB.integerValue)
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

  for i in 0..tempArr.count
    arr.replaceObjectAtIndex(indexA, withObject:tempArr.objectAtIndex(i))
    indexA += 1
  end
end

def merge_sort(arr, first, last)
  puts "merge_sort"
  if (first + 1 < last)
    mid = (first + last) / 2
    merge_sort(arr, first, mid)
    merge_sort(arr, mid, last)
    merge(arr, first, mid, last)
  end
end

def mergeSort(arr)
  puts "mergeSort"
  merge_sort(arr, 0, arr.count)
end

def quick_sort(arr, left, right)
  puts "quick_sort"
  index = partition(arr, left, right)

  if (left < index - 1)
    quick_sort(arr, left, index - 1)
  end

  if (index < right)
    quick_sort(arr, index, right)
  end
end

def quickSort(arr)
  puts "quickSort"
  quick_sort(arr, 0, arr.count - 1)
end

def sift_down(arr, start, stop)
  puts "sift_down"
  root = start

  while ((root * 2 + 1) <= stop)
    child = root * 2 + 1

    if (child + 1 <= stop && arr.objectAtIndex(child).integerValue < arr.objectAtIndex(child + 1).integerValue)
      child += 1
    end

    if (arr.objectAtIndex(root).integerValue < arr.objectAtIndex(child).integerValue)
      arr.exchangeObjectAtIndex(root, withObjectAtIndex:child)
      root = child
    else
      return
    end
  end
end

def heapify(arr, count)
  puts "heapify"
  start = (count - 2) / 2

  while (start >= 0)
    sift_down(arr, start, count - 1)
    start -= 1
  end
end

def heapSort(arr)
  puts "heapSort"
  heapify(arr, arr.count)

  stop = arr.count - 1

  while (stop > 0)
    arr.exchangeObjectAtIndex(stop, withObjectAtIndex:0)
    sift_down(arr, 0, stop - 1)
    stop -= 1
  end
end

def bubbleSort(arr)
  puts "bubbleSort"
  swapped = true
  k = 0

  while (swapped)
    swapped = false

    for i in 0..(arr.count - 1 - k)
      if (arr.objectAtIndex(i).integerValue > arr.objectAtIndex(i + 1).integerValue)
        arr.exchangeObjectAtIndex(i, withObjectAtIndex:i + 1)
        swapped = true
      end
    end
    k += 1
  end
end
