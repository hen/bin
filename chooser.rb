
# Define CHOICE_COUNTS as a Hash of 'Person' => number-of-choices
# Define OPTIONS as each 'Person's order of choice

# Dramatic time to sleep between announcements
SLEEP=0

# CHOICE_COUNTS and OPTIONS provided by passing in a Ruby file
puts "Loading './#{ARGV[0]}'"
require_relative "./#{ARGV[0]}"

# returns the sum of the indexes
def evaluateOrder(order, orders)
  chosen=[]
  sum_indexes=0

  order.each do |person|
    orders[person].each_with_index do |figure, idx|
      unless(chosen.include?(figure))
        sum_indexes += (idx + 1)
        chosen << figure
        break
      end
    end
  end
  return [sum_indexes, chosen]
end

choices=[]
CHOICE_COUNTS.each() do |choice, count|
  count.times do
    choices << choice
  end
end

permutations=choices.permutation.to_a.uniq
puts "\n\nThere are #{permutations.length} possible orders..."
sleep(SLEEP)

good_orders=[]
sums=[]
minimum=Float::INFINITY

permutations.each do |order|
  (sum, chosen)=evaluateOrder(order, OPTIONS)

  sums << sum

  if(sum < minimum)
    minimum=sum
    good_orders=[]
    good_orders << order.zip(chosen).sort
  elsif(sum == minimum)
    good_orders << order.zip(chosen).sort
  else
    # ignore
  end

end

p sums.uniq.sort

puts "After much calculating, #{good_orders.length} of those possible orders were the best..."
sleep(SLEEP)

good_orders.uniq!

puts "But it turns out that some were the same..."
sleep(SLEEP)

print "In fact there were really much less best possible orders...."
sleep(SLEEP)
print " There were........ "
sleep(SLEEP)
print " ........ "
sleep(SLEEP)
puts " #{good_orders.length} BEST ORDERS"
sleep(SLEEP)


good_orders.each_index do |idx|
  puts "\nBest Orders Variant ##{idx+1}:"
  good_orders[idx].each do |chosen|
    puts "  #{chosen[0]} gets #{chosen[1]}"
    sleep(SLEEP)
  end
end

