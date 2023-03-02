function search(content,edit)
	gg.setRanges(content[1]["memory"])
	gg.searchNumber(content[2]["value"],content[2]["type"])
	local value = gg.getValues(gg.getResults(999999))
	
	
	for i=1,gg.getResultCount() do
		local t = {}
		t[1] = {}
		t[1].address = value[i].address 
		t[1].flags = content[2]["type"]
		local num = 1

		for x=1,#content do
			if content[x]["offset"]~=nil then
				num = num+1
				t[num] = {}
				t[num].address = value[i].address+content[x]["offset"]
				t[num].flags = content[x]["type"]
			end
		end
		getVl = gg.getValues(t)

		
		local lv = {{["value"]=getVl[1].value}}
		local num = 1
		for c=1,#content do
			if content[c]["lv"]~=nil then
				num = num+1
				lv[num]={}
				lv[num].value=content[c]["lv"]
			end
		end

		local lv1 ={}
		for z=1,#t do
			lv1[z] = {}
			lv1[z].value = getVl[z].value
		end

		
		boolean = {}
	
		for m=1,#lv1 do
			if lv[m].value == lv1[m].value then
				boolean[m]="true"
			else
				boolean[m]="false"
			end
		end
		print(lv)
		print(lv1)
		print("\n\n")
		for k=1,#boolean do
			if boolean[k]=="false"then
				break 
			elseif k == #boolean then
				for n=1,#edit do
					local set = {}
					set[1] = {}
					set[1].address = value[i].address+edit[n]["offset"]
					set[1].flags = edit[n]["type"]
					set[1].value = edit[n]["value"]
					gg.setValues(set)
				end
				
			
			end
		end

		-- if lv == lv1 then
		-- 	for i=1,#edit do
		-- 		local set = {}
		-- 		set[1] = {}
		-- 		set[1].address = value[i].address+edit[i]["offset"]
		-- 		set[1].flags = edit[i]["type"]
		-- 		set[1].value = edit[i]["value"]
		-- 		gg.setValues(set)
		-- 	end
		-- end

	end

end
