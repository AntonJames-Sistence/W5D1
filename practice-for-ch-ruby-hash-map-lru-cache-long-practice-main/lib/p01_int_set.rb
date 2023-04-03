class MaxIntSet
  def initialize(max)
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % 4 # or num_buckets
    @store[bucket] << num
  end

  def remove(num)
    #ask proper bucket to remove item
    @store.each { |bucket| bucket.delete(num) if bucket.include?(num) }
  end

  def include?(num)
    @store.each { |bucket| return true if bucket.include?(num) }
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end