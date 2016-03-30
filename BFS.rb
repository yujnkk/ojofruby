$list = {
  "A" => ["B","D","E"],
  "B" => ["C"],
  "C" => ["D","E"],
  "D" => ["C","E"],
  "E" => ["B"],
 }
$Graph = {AB:"5",BC:"4",CD:"8",DC:"8",DE:"6",AD:"5",CE:"2",EB:"3",AE:"7"}
$Max = 9999
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

def dfsc(str,distance)
	@times=0
	dfs str[0],str[1],0,distance
	return @times
end	

def dfs(cur,dst,current_distance,distance)
	if current_distance > distance
		return nil
	end

	if cur == dst&&current_distance!=0
		@times+=1
		p @times
	end
	$list[cur].each do |char|
    print cur+char+"\n"
	dfs(char,dst,current_distance+$Graph[(cur+char).to_sym].to_i,distance)
	end

end

def dfscc(str)
    dfs1(str[0],str[1],0)
	p $Max
end

def dfs1 cur,dst,distance
	if distance>$Max
		return nil
	end
	if cur == dst&&distance!=0
		if distance<$Max
			$Max = distance
		end
	end
	$list[cur].each do |char|
		dfs1 char,dst,distance+$Graph[(cur+char).to_sym].to_i
    end
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
p dfsc("CC",30)
p dfscc("AC")


