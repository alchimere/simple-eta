# simple-eta
Very simple ETA class to use in every day scripts - ruby 1.8.7 compatible

## Example

```ruby
1.8.7-head :095 > eta = SimpleETA.new(42)
 => #<SimpleETA:0x7f25deeaac58 @start_time=Fri Aug 03 12:06:07 +0200 2018, @format="\r[%2$d/%1$d] %3$.2f%% ETA %5$s", @total=42> 
1.8.7-head :096 > 42.times { |i| sleep 2; eta.show(i) }
[16/42] 38.10% ETA 00m 58s
```
