$list = {
  "A" => ["B","D","E"],
  "B" => ["C"],
  "C" => ["D","E"],
  "D" => ["C","E"],
  "E" => ["B"],
 }
$Graph = {AB:"5",BC:"4",CD:"8",DC:"8",DE:"6",AD:"5",CE:"2",EB:"3",AE:"7"}

def bfs(str,steps)
	queue = [str[0]]
	queue1 = ["0"]
	queue1.pop
	results = 0
	steps.times do
	while(!queue.empty?)
		node = queue.pop()
        $list[node].each do |child|
		  if child==str[1] then results+=1 end  
		  queue1.push(child)
		end
		end
	queue = queue1.clone
	queue1.clear
	p queue
	end
	return results
end

def distance(str)
	str = str.delete "-"
    i = str.length
	sum = 0
	t = 0
	while t < i
		sub=str[t,t+2]
		if($Graph[sub.to_sym].to_i == 0)
			return "NO SUCH ROUTE" 
		end
		sum+=$Graph[sub.to_sym].to_i
		t+=1
	end
	return sum
end


p distance("A-E-D")
p bfs("CC",5)




