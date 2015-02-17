## RubyMotion benchmark against Swift

Based on http://www.jessesquires.com/apples-to-apples-part-two/.

I'm using Xcode 6.1.1. Not sure why Swift is so slow -- I ran it
in release mode. Some sort of optimization flag I don't know about?

```
            Std     Quick   Heap    Insert  Select
ObjC        0.007   0.006   0.014    1.3     2.73
Swift       0.010   0.011   0.024   15.0    11.93
RubyMotion  0.007   0.431   0.107   10.5    12.37
```

