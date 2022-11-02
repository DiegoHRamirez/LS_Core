def method(&block)
  yield
  block.call
end

method #{ puts "hi" }