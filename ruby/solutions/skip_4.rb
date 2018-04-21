buf = []
(1..16).each do |n|
  buf << n
  if buf.length == 4 then
      p buf
      buf = []
  end
end
