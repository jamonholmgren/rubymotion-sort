## RubyMotion benchmark against Swift

Based on http://www.jessesquires.com/apples-to-apples-part-two/.

Xcode Beta 6.3 (Swift 1.2)
RubyMotion 3.5

All three running in `release` mode with `-O3` for ObjC and `-O` for Swift.

My machine is a Late 2013 13" MacBook Pro Retina, 2.4 GHz i5, 8 GB RAM, running OS X 10.10.2.

```
              Std   Quick    Heap Insert   Select
ObjC        0.008   0.007   0.015    1.3     2.82
Swift       0.008   0.011   0.023   10.8     9.00
RubyMotion  0.007   0.066   0.161   21.5    17.03
```

### Full Results


```
Swift sort: 0.007850 s (± 0.000925)
Quick sort: 0.010864 s (± 0.002010)
Heap sort: 0.022819 s (± 0.006767)
Insertion sort: 10.846719 s (± 0.370417)
Selection sort: 9.003071 s (± 0.519540)
```

```
2015-02-18 11:09:09.837 ObjcSorts[15765:939618] Objective-C sort average time = 0.007628 sec
2015-02-18 11:09:09.837 ObjcSorts[15765:939618] Merge sort average time = 0.029703 sec
2015-02-18 11:09:09.837 ObjcSorts[15765:939618] Quick sort average time = 0.007460 sec
2015-02-18 11:09:09.837 ObjcSorts[15765:939618] Bubble sort average time = 3.258163 sec
2015-02-18 11:09:09.837 ObjcSorts[15765:939618] Heap sort average time = 0.015136 sec
2015-02-18 11:09:09.838 ObjcSorts[15765:939618] Insertion sort average time = 1.353727 sec
2015-02-18 11:09:09.838 ObjcSorts[15765:939618] Selection sort average time = 2.822800 sec
```

```
RubyMotion sort average time = 0.00776020288467407 sec
Quick      sort average time = 0.0659250974655151 sec
Heap       sort average time = 0.161083036661148 sec
Insertion  sort average time = 21.5382670581341 sec
Selection  sort average time = 17.0347119450569 sec
Merge      sort average time = 0.162473559379578 sec
Bubble     sort average time = 35.8965599417686 sec
```


