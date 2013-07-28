require 'pry'

require_relative 'project_euler_helpers'
require_relative 'project_euler_inputs'


def prob1
  to_sum= []
  for i in (0...1000)
    if i % 3 == 0
      to_sum.push i
    elsif i % 5 == 0
      to_sum.push i
    end
  end
  sum = 0
  to_sum.reduce(:+)
  sum
end

def prob2 #sum of even fibinacci up to 4,000,000
  num = 0
  num_next = 1
  to_sum = []
  while num < 4000000
    num, num_next = num_next, num + num_next
    if num.even?
      to_sum.push num
    end
  end
  to_sum.reduce(:+)
end

def prob3 # largets prime factory of 600851475143
  max = 600851475143 ** 0.5
  for i in (1..max).step(2)
    if 600851475143 % i == 0 #need if prime
      if is_prime(i)
        ans = i
      end
    end
  end
  ans
end

def prob3easy
  require 'prime'
  array = Prime.prime_division(600851475143)
  answer = array[-1][0]**array[-1][1]
  answer
end

def prob4 #largest palindrome from product of 3 digit number numbers
  ans = 0
  for i in 900..999
    for j in 900..999
      candidate = i*j
      if is_palindrome(candidate.to_s.chars)
        ans = i*j
      end
    end
  end
  ans
end

def prob5 # smallest positive number evenly divisible by 1-20
  ans = 2520
  while true
    if ans % 20 == 0
      if ans % 19 == 0
        if ans % 18 == 0
          if ans % 17 == 0
            if ans % 16 == 0
              if ans % 15 == 0
                if ans % 14 == 0
                  if ans % 13 == 0
                    if ans % 12 == 0
                      if ans % 11 == 0
                        return ans
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    ans += 20
  end
end

def prob6 #difference between the sum of squar of 1-100 and square of the sum
  squares = []
  nums_to_squares = 0
  sum_of_squared = 0
  for i in (0..100)
    squares << (i *= i)
  end
  squares.each { |i| sum_of_squared += i } #sum of squared numbers
  for i in (0..100)
    nums_to_squares += i
  end
  squared_sum = (nums_to_squares * nums_to_squares)
  ans = squared_sum - sum_of_squared
  ans
end

def prob7 # what is the 10001st prime #
  ans = 0
  num_primes = 0
  require 'prime'
  pg = Prime::Generator23.new
  while true
    test = pg.next()
    # if is_prime(test)
    if Prime.instance.prime?(test) #way faster
      num_primes +=1
      if num_primes == 10001
        return test
      end
    end
  end
end

def prob7_1 # what is the 10001st prime #
  ans = 0
  num_primes = 0
  require 'prime'
  pg = Prime.new
  while true
    test = pg.next()
    num_primes +=1
    if num_primes == 10001
      return test
    end
  end
end

def prob8 # greatest product of 5 consecutive #'s in these [7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450].
  list = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450
  highest = 0
  list = list.to_s.chars
  list.length.times { |i| list[i] = list[i].to_i }
  for i in (0..(list.length-5))
    current = (list[i] * list[i + 1] * list[i + 2] * list[i + 3] * list[i + 4])
    if current > highest
      highest = current
    end
  end
  highest
end

def prob9 # product of a,b,c where a,b,c are pythagotean tripplet which a+b+c = 1000
  for a in (200..400)
    for b in (200..400)
      c = (1000 - a - b)
      if (a*a + b*b) == c*c
        return (a*b*c)
      end
    end
  end
  p 'ended without answer'
end

def prob10 # sum of all prime #'s below 2,000,000
  require 'prime'
  total = 0
  pg = Prime::Generator23.new
  while true
    test = pg.next()
    if Prime.instance.prime?(test)
      if test > 2000000
        break
      else
        total += test
      end
    end
  end
  total
end

def prob11(grid)
  ans = [check_rows(grid), check_columns(grid), check_diagonals(grid)].max
end

def prob12 #What is the value of the first triangle number to have over five hundred divisors?
  n = 1000
  divisors = 0
  while divisors < 500
    divisors = divisor_counter(triangle_num_gen(n))
    n +=1
    # if n % 100 == 0
    #   p "trangle number #{n} is: #{triangle_num_gen(n)} founds @ #{Time.now}"
    # end
  end
  n -= 1
  p "The #{n}th triangle number has #{divisor_counter(triangle_num_gen(n))} divisors"
  triangle_num_gen(n)
end

def prob13(nums)
  ans = 0
  nums.each do |n|
    ans += n
  end
  ans
end





# print 'Starting Problem 1: '
# p prob1
# print 'Starting Problem 2: '
# p prob2
# print 'Starting Problem 3: '
# p prob3
# print 'Starting Problem 4: '
# p prob4
# print 'Starting Problem 5: '
# p prob5
# print 'Starting Problem 6: '
# p prob6
# print 'Starting Problem 7: '
# p prob7
# print 'Starting Problem 7.1: '
# p prob7_1
# print 'Starting Problem 8: '
# p prob8
# print 'Starting Problem 9: '
# p prob9
# print 'Starting Problem 10: '
# p prob10
# print 'Starting Problem 11: '
# p prob11(@prob11_grid)
# print 'Starting Problem 12: '
# p prob12
 # print 'Starting Problem 13: '
 # p prob13(@problem_13_numbers)
print 'Starting Problem 14: '
p prob14

