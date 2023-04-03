require 'byebug'
class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] = true if self.is_valid?(num)
  end

  def remove(num)
    @store[num] = false if self.is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds"  if num > @store.length-1 || num < 0
    true
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % num_buckets
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
    @store.each { |bucket| return bucket if bucket.include?(num) }
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self.resize! if @store.length == count
    if !self.include?(num)
      bucket = num % num_buckets
      @store[bucket] << num
      @count += 1
    end
  end

  def remove(num)
    @store.each do |bucket| 
      if bucket.include?(num)
        bucket.delete(num)
        @count -= 1
      end
    end
  end

  def include?(num)
    @store.each { |bucket| return true if bucket.include?(num) }
    false
  end

  private

  def num_buckets
    @store.length
  end

  def resize!

    old_store = @store # keep our old store so we can use old items to reassign them
    # debugger
    new_num_bucket = count * 2
    @store = Array.new(new_num_bucket) { Array.new } # create new store

    old_store.each do |backet|
      backet.each do |ele|
        bucket = ele % new_num_bucket
        @store[bucket] << ele
      end
    end


  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store.each { |bucket| return bucket if bucket.include?(num) }
  end
end