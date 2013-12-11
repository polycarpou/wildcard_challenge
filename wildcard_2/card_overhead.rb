require 'pry'
require 'pp'
generation_time = [9, 10, 21, 20, 7, 11, 4, 15, 7, 7, 14, 5, 20, 6, 29, 8, 11, 19, 18, 22, 29, 14, 27, 17, 6, 22, 12, 18, 18, 30]
overhead        = [21, 16, 19, 26, 26, 7, 1, 8, 17, 14, 15, 25, 20, 3, 24, 5, 28, 9, 2, 14, 9, 25, 15, 13, 15, 9, 6, 20, 27, 22]

def reorder(unordered_generation_time, unordered_overhead)
  ordered_generation = []
  ordered_overhead = []
  30.times do
    index_of_max_overhead = unordered_overhead.index(unordered_overhead.min)
    ordered_generation << unordered_generation_time[index_of_max_overhead]
    ordered_overhead << unordered_overhead[index_of_max_overhead]

    unordered_generation_time.delete_at(index_of_max_overhead)
    unordered_overhead.delete_at(index_of_max_overhead)
  end
  [ordered_generation, ordered_overhead]
end

def count_time(generation_time, overhead, final_set)
  time_sum = 0
  output_arr = []
  final_set.times do |i|
    time_sum += generation_time[i] + overhead[i]*(final_set-1)
    output_arr << time_sum
  end
  output_arr
end

def try_all_final_set_numbers(generation_time, overhead)
  out = {}
  (1..30).each do |final_set|
    array_of_times = count_time(generation_time, overhead, final_set)
    array_of_times = array_of_times.reject { |e| e > 2912 }
    out[final_set] = array_of_times
  end
  out
end
#p count_time(generation_time, overhead)

ordered_generation_time, ordered_overhead = reorder(generation_time, overhead)
pp try_all_final_set_numbers(ordered_generation_time, ordered_overhead)

# [9, 35, 94, 192, 303, 349, 359, 430, 573, 706, 870, 1150, 1410, 1455, 1820, 1903, 2362, 2534, 2588, 2876, 3085, 3624, 3981, 4297, 4663, 4910, 5078, 5636, 6410, 7078]
