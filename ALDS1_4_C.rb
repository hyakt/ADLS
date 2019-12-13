class Dictionary

  def initialize(size)
    @size = size
    @arr = Array.new(size)
  end

  def _hash(s)
    sum = 0
    s.each_char{ |c| sum += c.ord}
    return sum % @size
  end

  def insert(s)
    n = 0
    if @arr[_hash(s)] == s
      return "#{s} is already inserted."
    end
    
    while n < @size
      p = (_hash(s)+n) % @size
      if @arr[p].nil?
        @arr[p] = s
        return
      end
      n += 1
    end
  end

  def find(s)
    n = 0
    while n < @size
      if @arr[(_hash(s)+n) % @size] == s
        return 'yes'
      end
      n +=1
    end
    return 'no'
  end
  
end

size = gets.to_i
d = Dictionary.new(size)

size.times do
  sp = gets.chomp.split(" ")
  if sp[0] == "insert"
    d.insert(sp[1])
  else
    puts d.find(sp[1])
  end
end