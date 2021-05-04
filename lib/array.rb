# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.count == 0
        return nil
    end
    self.sort.pop - self.sort.shift
  end

  def average
    if self.count == 0
        return nil
    end

    self.sum(0.0) / self.count
  end

  def median
    if self.count == 0
        return nil
    end
    
    if self.length.odd?
        middle = self.length / 2
        return self.sort[middle]
    end
    if self.length.even?
        sorted = self.sort
        middle = self.length / 2
        ele_1 = sorted[middle]
        ele_2 = sorted[middle - 1]
        return (ele_1 + ele_2) / 2.0
    end
  end

  def counts
    count = Hash.new {0}
    self.each { |ele| count[ele] += 1}
    return count
  end

  def my_count(arg)
    count = 0
    self.each do |ele|
        if ele == arg
            count += 1
        end
    end
    count
  end

  def my_index(arg)
    self.each_with_index do |ele, i|
        if ele == arg
            return i
        end
    end
    nil
  end

  def my_uniq
    hash = {}
    self.each { |ele| hash[ele] = true }
    hash.keys
  end

  def my_transpose
    new_arr = []
    (0...self.length).each do |row|
        new_row = []
        (0...self.length).each do |column|
            new_row << self[column][row]
        end
        new_arr << new_row
    end
    new_arr
  end
end
