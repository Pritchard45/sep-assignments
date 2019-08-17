# recursive method
def fib_r(n)
    if (n == 0)
      # #1
      return 0
    elsif (n == 1)
      # #2
      return 1
    else
      # #3
      return fib_r(n-1) + fib_r(n-2)
    end
  end

# iterative method
def fib_i(n)
  if n == 0
    return 0
  else
    fib_0 = 0
    fib_1 = 1
    (1..(n-1)).each do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
    end
    return fib_1
  end
end


start_time = Time.now
p fib_i(20)
end_time = Time.now
puts " Runtime in miliseconds(iterative): #{end_time - start_time} "

print "\n"

start_time = Time.now
p fib_r(20)
end_time = Time.now
puts "Runtime in miliseconds (recursive): #{end_time - start_time} "
