--author: apollo
--高级藏宝图：查看宝藏埋藏的地点

Item51075 = {
}

function Item51075:MapUse(target)
    local mapId = player:GetMap_id();
	local map_id, x, y

	map_id = item:GetItemValue1()
	if map_id == 0 then
		local range = {	
		{map_id=1  ,x1=5,y1=10,x2=142, y2=344},
		{map_id=2  ,x1=5,y1=10,x2=61, y2=268},
		{map_id=6  ,x1=5,y1=10,x2=97, y2=294},
		{map_id=7  ,x1=5,y1=10,x2=115, y2=344},
		{map_id=8  ,x1=5,y1=10,x2=82,y2=273},
		{map_id=10  ,x1=5,y1=10,x2=75, y2=362},
		{map_id=11  ,x1=5,y1=10,x2=120,y2=403},			
		{map_id=12,x1=5,y1=10,x2=112, y2=392},
		 {map_id=14,x1=5,y1=10,x2=393, y2=294},
		{map_id=15,x1=5,y1=10,x2=56, y2=176},			
		{map_id=17  ,x1=5,y1=10,x2=73,y2=215},			
		{map_id=19,x1=5,y1=10,x2=205, y2=800},
		{map_id=26,x1=5,y1=10,x2=54, y2=172},
		{map_id=84,x1=5,y1=10,x2=89, y2=291},
		{map_id=108,x1=5,y1=10,x2=98, y2=513}}	
		local loc = RandMapLoc(range)
		map_id = loc.map_id
		x = loc.x
		y = loc.y

		item:SetItemValue1(map_id)
		item:SetItemValue2(x)
		item:SetItemValue3(y)
	else
		x = item:GetItemValue2()
		y = item:GetItemValue3()
	end

	if map_id == player:GetMap_id() then
		local tx = player:GetCurPosX()
		local ty = player:GetCurPosY()

		if PosInRange(tx, ty, x, y, 5) then
			self:Reached(target)
		else
		  --ShowHint(string.format("宝藏图上的坐标位于%s的%s,%s", GetMapName(map_id),x, y))
          --player:JumpMap(map_id,x,y)
		  IAsk(string.format("宝藏图上的坐标位于%s的%s,%s \r\#Y你好,我是GM派来的救兵，我可以把你直接传送到宝藏所在位置，要不要试一下？\#R只要20万银两喔", GetMapName(map_id),x, y))
          SetAnswer(1,"传送")
          SetAnswer(2,"我才不要")
          SetAnswer(3,"我才不要")
		  SetAnswer(4,"我才不要")
          WaitAnswer(4)
            if GetAnswer() == 1 then 
				if player:GetMoney() < 200000 then
					ShowHint("#P传送可不是免费的喔！没有20万银两，我不会帮你的！")
					return
				end
				if player:GetLevel() < 10 then
					ShowHint(string.format("\#P%s\#W等级小于10级无法使用", player:GetName()))
					return
				end
				if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604)or player:GetQuests():HasQuest(30605)then
					ShowHint(string.format("\#P%s\#W有押镖任务无法传送", player:GetName()))
					return
				end
				if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
					ShowHint(string.format("\#P%s\#W有跑商任务无法传送", player:GetName()))
					return
				end
				if mapId == 252 then
					ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", player:GetName()))
					return
				end
			   player:ChangeMoney(-200000)	
			   player:JumpMap(map_id,x,y)
			   end
		    end
	else
    --ShowHint(string.format("宝藏图上的坐标位于%s的%s,%s", GetMapName(map_id),x, y))
    --player:JumpMap(map_id,x,y)
	IAsk(string.format("宝藏图上的坐标位于%s的%s,%s \r\#Y你好,我是GM派来的救兵，我可以把你直接传送到宝藏所在位置，要不要试一下？\#R只要20万银两喔", GetMapName(map_id),x, y))
          SetAnswer(1,"传送")
          SetAnswer(2,"我才不要")
		  SetAnswer(3,"我才不要")
		  SetAnswer(4,"我才不要")
          WaitAnswer(4)
            if GetAnswer() == 1 then 
			   if player:GetMoney() < 200000 then
					ShowHint("#P传送可不是免费的喔！没有20万银两，我不会帮你的！")
					return
				end
				if player:GetLevel() < 10 then
					ShowHint(string.format("\#P%s\#W等级小于10级无法使用", player:GetName()))
					return
				end
				if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604) or player:GetQuests():HasQuest(30605) then
					ShowHint(string.format("\#P%s\#W有押镖任务无法传送", player:GetName()))
					return
				end
				if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
					ShowHint(string.format("\#P%s\#W有跑商任务无法传送", player:GetName()))
					return
				end
				if mapId == 252 then
					ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", player:GetName()))
					return
				end
			   player:ChangeMoney(-200000)	
			   player:JumpMap(map_id,x,y)
		    end
	end
end
function Item51075:Reached(target)
	if not item:ReduceCount() then return end
	local A = math.random(1,10)
	local B = math.random(1,2) 
	if player:GetItems():GetFreeSlot(0) > 0 then	
	  if A <= 3 then 
			local ItemList = {
			{ itemid = 40000,	itemname = "高级反击"},
			{ itemid = 40001, itemname = "高级反震"},
			{ itemid = 40002, itemname = "高级吸血"},
			{ itemid = 40003, itemname = "高级连击"},
			{ itemid = 40004, itemname = "高级飞行"},
			{ itemid = 40005, itemname = "高级夜战"},
			{ itemid = 40006, itemname = "高级隐身"},
			{ itemid = 40007, itemname = "高级感知"},
			{ itemid = 40008, itemname = "高级再生"},
			{ itemid = 40009, itemname = "高级冥想"},
			{ itemid = 40010, itemname = "高级慧根"},
			{ itemid = 40011, itemname = "高级必杀"},
			{ itemid = 40012, itemname = "高级幸运"},
			{ itemid = 40013, itemname = "高级神迹"},
			{ itemid = 40014, itemname = "高级招架"},
			{ itemid = 40015, itemname = "高级永恒"},
			{ itemid = 40016, itemname = "高级敏捷"},
			{ itemid = 40017, itemname = "高级强力"},
			{ itemid = 40018, itemname = "高级防御"},
			{ itemid = 40019, itemname = "高级偷袭"},
			{ itemid = 40020, itemname = "高级毒"},
			{ itemid = 40021, itemname = "高级驱鬼"},
			{ itemid = 40022, itemname = "高级鬼魂术"},
			{ itemid = 40023, itemname = "高级魔之心"},
			{ itemid = 40024, itemname = "高级神佑复生"},
			{ itemid = 40025, itemname = "高级精神集中"},
			{ itemid = 40026, itemname = "高级否定信仰"},
			{ itemid = 40027, itemname = "高级法术连击"},
			{ itemid = 40028, itemname = "高级法术暴击"},
			{ itemid = 40029, itemname = "高级法术波动"},
			{ itemid = 40000,	itemname = "高级反击"},
			{ itemid = 40001, itemname = "高级反震"},
			{ itemid = 40004, itemname = "高级飞行"},
			{ itemid = 40006, itemname = "高级隐身"},
			{ itemid = 40007, itemname = "高级感知"},
			{ itemid = 40008, itemname = "高级再生"},
			{ itemid = 40009, itemname = "高级冥想"},
			{ itemid = 40010, itemname = "高级慧根"},
			{ itemid = 40012, itemname = "高级幸运"},
			{ itemid = 40013, itemname = "高级神迹"},
			{ itemid = 40014, itemname = "高级招架"},
			{ itemid = 40015, itemname = "高级永恒"},
			{ itemid = 40016, itemname = "高级敏捷"},
			{ itemid = 40017, itemname = "高级强力"},
			{ itemid = 40018, itemname = "高级防御"},
			{ itemid = 40020, itemname = "高级毒"},
			{ itemid = 40021, itemname = "高级驱鬼"},
			{ itemid = 40022, itemname = "高级鬼魂术"},
			{ itemid = 40025, itemname = "高级精神集中"},
			{ itemid = 40026, itemname = "高级否定信仰"},
			}		
			local r = RandTable(ItemList)
			ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！#89")
			player:GetItems():AddItem(r.itemid, 1)
			script:Rumor(string.format("%s #O在野外挖宝时,获得了一本#Y[高级魔兽要诀]#24~", player:GetCharNameLink(), r.itemname), false)
		elseif A <= 10 then   	
		  local map = {}
	  	if player:GetLevel() <= 35 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621}, mob_id = 75}}    --朱紫国
		
		  elseif player:GetLevel() <= 45 then
		  	map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626}, mob_id = 75}}    --朱紫国
		  elseif player:GetLevel() < 55 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629}, mob_id = 75}}    --朱紫国
		  elseif player:GetLevel() < 65 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633}, mob_id = 75}}    --朱紫国
		  elseif player:GetLevel() < 75 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637}, mob_id = 75}}    --朱紫国
		  elseif player:GetLevel() < 85 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639}, mob_id = 75}}    --朱紫国
		  elseif player:GetLevel() < 95 then
			  map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644}, mob_id = 75}}    --朱紫国
		    else
			    map = {	
					{map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 135}, --建邺
					{map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",    npc_lv = 0, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 138}, --傲来国
					{map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 150},  --花果山
					{map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",  npc_lv = 5, npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 54 }, --北俱芦洲
					{map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 78 },  --长寿村郊外
					{map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",    npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 129},  -- 大唐境外
					{map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",      npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 75 },  -- 大唐国境	
					{map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",  npc_lv = 15,npc_id = {614,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654}, mob_id = 75}}    --朱紫国
					end		
		    ShowHint("你一铲子挖下去,好像挖倒了什么建筑物~#35")		
		    
		    local map_id, x1, y1,x2,y2,map_name,npc_lv,npc_id,mob_id
		    local loc = RandTable(map)
		    map_id = loc.map_id
		    x1 = loc.x1
		    y1 = loc.y1
		    x2 = loc.x2
		    y2 = loc.y2
		    map_name = loc.map_name
		    npc_lv = loc.npc_lv
		    mob_id = loc.mob_id
		    local oneMap = { {  map_id = map_id , x1 = x1, y1 = y1, x2 = x2 - 10 , y2 = y2 -10 }}
		    script:Rumor(string.format(" %s \#W在挖宝时砸坏了#A怪物幼儿园#W,一群宝宝正在\#P%s\#W哭闹,各路英雄快来领养#46!\#G（%d线）", player:GetCharNameLink(), map_name, player:GetMap():GetLine_id()), false)		
		    for i = 1, 20 do
		    local loc1 = RandMapLoc(oneMap)
		    if loc1 then			
		      local lv = player:GetLevel()
		      local idx
		      if lv < 35 then
		        idx = 7 
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 45 then
		        idx = 12 
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 55 then
		        idx = 15
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 65 then 
		        idx = 19
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 75 then
		        idx = 23 
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 85 then
		        idx = 25
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      elseif lv < 95 then 
		        idx = 35 
				local R = math.random(1,idx)
				npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      else
		        idx = 40
		        local R = math.random(1,idx)
		        npc_id = loc.npc_id[R]
			    script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 600, player:GetMap():GetLine_id())
		      end
		    end
		  end
		elseif A <= 8 then
		  local rr = math.random(1, 150)
		  if rr < 5 then
		    Item = RandTable({15006,15007,15008,15009,80170,80171})
		    player:GetItems():AddItem(Item, 1)
			ShowHint("#Y恭喜!你得到了一件妖怪遗留的宝贝.#129")
			script:Rumor(string.format(" %s \#W在挖宝时意外获得了一个#A %s", player:GetCharNameLink(), GetItemName(Item)),false)
		  else
		    Item = RandTable({20450,20451,20452,20459,20460,20461,20468,20469,20470,20477,20478,20479,20486,20487,20488,20495,20496,20497,20504,20505,20506,20513,20514,20515,20522,20523,20524,20531,20532,20533,20540,20541,20542,20549,20550,20551,20552,20558,20559,20560,20561,20567,20568,20569,20570,20576,20577,20578,20579,20587,20588,20589,20590,20591,20592,20593,20594,20600,20601,20602,20603,20611,20612,20613,20614,20615,20616,20617,20618})
		    player:GetItems():AddItem(Item, 1)
	        ShowHint("#Y恭喜!你得到了一件妖怪遗留的宝贝.#129")
		  end
	  elseif A <= 10 then 
	  player:GetItems():AddItem(40039)
	  ShowHint("恭喜!获得了一个神兜兜#129")
	  script:Rumor(string.format(" %s \#W在挖宝时意外获得了一个#A神兜兜", player:GetCharNameLink()), false)
    end
  else
		ShowHint("很遗憾，你的当前包裹已满，所挖宝贝丢失……#24")
	end
end
	

function Item51075:CanUse(user, target)
end

function Item51075:BattleUse(user, target)
end

AddItemTable(Item51075)