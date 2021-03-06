# representing the scope of a variable
class Environment
  def initialize
    @store = {}
  end

  def self.new_enclosed(outer)
    env = Environment.new
    env.init_outer(outer)
    env
  end

  def init_outer(outer)
    @outer = outer
  end

  def get(name)
    result = @store[name]
    result = @outer.get(name) if result.nil? && !@outer.nil?
    result
  end

  def set(name, val)
    @store[name] = val
    val
  end
end
