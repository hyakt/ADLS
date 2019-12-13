class LinkedList

  attr_reader :first, :last
  
  Node = Struct.new("Node", :prev, :next, :key)
  
  def initialize(key)
    @first = @last = Node.new(nil, nil, key)
  end

  def insert(key)
    if @first.nil? and @last.nil?
      initialize(key)
    else
      @last.next = @last = Node.new(@last, nil, key)
    end
  end

  def delete(key)
    x = list_search(key)
    return if x.nil?
    unless x.prev.nil?
      x.prev.next = x.next
    else
      delete_last
    end
    unless x.next.nil?
      x.next.prev = x.prev
    else
      delete_first
    end
  end

  def delete_last
    if @first.next.nil?
      @first = @last = nil
    else
      @first.next.prev = nil
      @first = @first.next
    end
  end

  def delete_first
    if @last.prev.nil?
      @first = @last = nil
    else
      @last.prev.next = nil
      @last = @last.prev
    end
  end

  def list_search(key)
    value = @last
    until value.nil?
      if value.key == key
        return value
      end
      value = value.prev
    end
  end

  def reverse_print
    value = @last
    printable = ""
    until value.nil?
      printable <<= "#{value.key} "
      value = value.prev
    end
    puts printable.chop
  end
end

n = gets.chomp.to_i
c = n.times.collect { gets.chomp.split(" ") }

a = LinkedList.new(c.shift[1].to_i)

c.each do |x, y|
  eval("a.#{x}(#{y})")
end

a.reverse_print
