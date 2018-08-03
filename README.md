# simple-eta
Very simple ETA class to use in every day scripts - ruby 1.8.7 compatible

## Example

```ruby
2.2.2 :049 > eta = SimpleETA.new(42)
 => #<SimpleETA:0x00000000b6c2b8 @start_time=2018-08-03 12:02:04 +0200, @total=42, @format="\r[%2$d/%1$d] %3$.2f%% ETA %5$s"> 
2.2.2 :050 > 42.times { |i| sleep 2; eta.show(i) }
[12/42] 28.57% ETA 01m 05s
```
