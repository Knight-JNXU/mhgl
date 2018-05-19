-- 定义物品表 : 物品表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Item20000 = {							--低级宝图
} 

-- item 代表使用中的 CItem object，在這裡可使用 CItem 的方法
-- 如果这物品在地图使用，必需定义 MapUse 方法
-- 如果这物品在战斗使用，必需定义 CanUse 及 BattleUse 方法
-- 没有需要时，可免写 MapUse 或 CanUse,BattleUse 方法

-- MapUse 是用地圖上使用該物品時 call 的
-- target : 該物品使用的對象，可以是玩家、同伴或寵物
function Item20000:MapUse(target)
    local mapId = player:GetMap_id();
	if player:GetLevel() < 30 then
		ShowHint("等你到达30级再来进行探险挖宝吧")
		return
	end	
	if HasQuest(30601) or HasQuest(30602) or HasQuest(30603) or HasQuest(30604) or HasQuest(30605) then
		ShowHint("跑镖途中不能挖宝")
		return
	end
	local map_id, x, y

	-- 取得這個物品 item value 1 值為 map_id
	map_id = item:GetItemValue1()
	-- 如果還沒設定
	if map_id == 0 then
		-- 位置表， {map_id, x1,y1,x2,y2} 中 x1,y1,x2,y2 代表范圍 
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
		{map_id=84,x1=5,y1=10,x2=89, y2=291}}	
		local loc = RandMapLoc(range)
		map_id = loc.map_id
		x = loc.x
		y = loc.y
			-- 將位置記錄在 item value 中
		item:SetItemValue1(map_id)
		item:SetItemValue2(x)
		item:SetItemValue3(y)
		print("SetItemValue", map_id, x, y)
		--ShowHint(string.format("%s   %s\\", x, y))
		
		-- 隨機從位置表中找一個空的位置放置
	else
		-- 取得這個物品 item value 2,3 值為 x,y
		x = item:GetItemValue2()
		y = item:GetItemValue3()
		print("GetItemValue", map_id, x, y)
	--	ShowHint(string.format("%s   %s\\", x, y))

	end
	-- 如果玩家正在目标地图
	if map_id == player:GetMap_id() then
		-- 取得玩家现在位置
		local tx = player:GetCurPosX()
		local ty = player:GetCurPosY()
		-- 玩家位置是否在目标位置范围 5 内
		if PosInRange(tx, ty, x, y, 5) then
			-- 玩家到达目标位置时
			self:Reached(target)
		else
			-- 计算目标与玩家的差距及方向
			local dis = CalcDistance(tx, ty, x, y)
			local dir = CalcDirection(tx, ty, x, y)
			-- 方向对应表
			local dirMap = {	["SW"] = "西南方\#P↓",
								["S"]  = "正南方\#P↘",
								["SE"] = "东南方\#P→",
								["E"]  = "正东方\#P↗",
								["NE"] = "东北方\#P↑",
								["N"]  = "正北方\#P↖",
								["NW"] = "西北方\#P←",
								["W"]  = "正西方\#P↙", }
			print("dir, dis", dir, dis)
			local strDir = dirMap[dir] or ""
			local strDis = ""
			if dis >= 0 and dis <= 20 then
				strDis = "极近的"
			elseif dis > 20 and dis <= 50 then
				strDis = "很近的"
			elseif dis > 50 and dis <= 80 then
				strDis = "比较近的"
			elseif dis > 80 and dis <= 110 then
				strDis = "比较远的"
			elseif dis > 110 and dis <= 140 then
				strDis = "很远的"
			else
				strDis = "极远的"
			end
		--	ShowHint(string.format("宝藏位于离这里%s%s\\", strDis, strDir))
		  --ShowHint(string.format("宝藏图上的坐标位于%s的%s,%s", GetMapName(map_id),x, y))
		  IAsk(string.format("宝藏图上的坐标位于%s的%s,%s \r\#Y你好,我是GM派来的救兵，我可以把你直接传送到宝藏所在位置，要不要试一下？\#R只要5万银两喔", GetMapName(map_id),x, y))
          SetAnswer(1,"传送")
          SetAnswer(2,"我才不要")
		  SetAnswer(3,"我才不要")
		  SetAnswer(4,"我才不要")
          WaitAnswer(4)
            if GetAnswer() == 1 then 
			   if player:GetMoney() < 50000 then
					NpcSay("传送可不是免费的喔！没有5万银两，我不会帮你的！")
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
			   player:ChangeMoney(-50000)	
			   player:JumpMap(map_id,x,y)
			   end
		    end
	else
		-- 玩家不在目标地图
		  --ShowHint(string.format("宝藏图上的坐标位于%s的%s,%s", GetMapName(map_id),x, y))
		  IAsk(string.format("宝藏图上的坐标位于%s的%s,%s \r\#Y你好,我是GM派来的救兵，我可以把你直接传送到宝藏所在位置，要不要试一下？\#R只要5万银两喔", GetMapName(map_id),x, y))
          SetAnswer(1,"传送")
          SetAnswer(2,"我才不要")
          SetAnswer(3,"我才不要")
		  SetAnswer(4,"我才不要")
          WaitAnswer(4)
            if GetAnswer() == 1 then 
			   if player:GetMoney() < 50000 then
					NpcSay("传送可不是免费的喔！没有5万银两，我不会帮你的！")
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
			   player:ChangeMoney(-50000)	
			   player:JumpMap(map_id,x,y)
			   end
		    end
	--	  player:JumpMap(map_id,x,y)
end
-- 玩家到达目标位置时
function Item20000:Reached(target)
	if not item:ReduceCount() then return end	
	  if player:GetItems():GetFreeSlot(0) > 0 then
	    local r = math.random(1, 100)
	    if r < 10 then  --5%几率获得魔兽要诀
	      if player:GetMap_id() == 7 then 
			    local ItemListZ = {
					    { itemid = 10082,	itemname = "吸血"},
					    { itemid = 10083, itemname = "连击"},
					    { itemid = 10084, itemname = "飞行"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 15 then 
			    local ItemListZ = {
					    { itemid = 10091,	itemname = "必杀"},
					    { itemid = 10092, itemname = "幸运"},
					    { itemid = 10105, itemname = "精神集中"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 1 then 
			    local ItemListZ = {
					    { itemid = 10099,	itemname = "偷袭"},
					    { itemid = 60200, itemname = "水攻"},
					    { itemid = 60201, itemname = "烈火"},
					    { itemid = 60202, itemname = "落岩"},
					    { itemid = 60203, itemname = "雷击"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 6 then 
			    local ItemListZ = {
					    { itemid = 10086,	itemname = "隐身"},
					    { itemid = 10088, itemname = "再生"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 2 then 
			    local ItemListZ = {
					    { itemid = 10085,	itemname = "夜战"},
					    { itemid = 10081, itemname = "反震"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 19 then 
			    local ItemListZ = {
					    { itemid = 60200, itemname = "水攻"},
					    { itemid = 60201, itemname = "烈火"},
					    { itemid = 60202, itemname = "落岩"},
					    { itemid = 60203, itemname = "雷击"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 26 then 
			    local ItemListZ = {
					    { itemid = 10101, itemname = "驱鬼"},
					    { itemid = 10090, itemname = "慧根"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 14 then 
			    local ItemListZ = {
					    { itemid = 10089, itemname = "冥思"},
					    { itemid = 10104, itemname = "神佑复生"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 84 then 
			    local ItemListZ = {
					    { itemid = 10108, itemname = "法术暴击"},
					    { itemid = 10103, itemname = "魔之心"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 12 then 
			    local ItemListZ = {
					    { itemid = 10097, itemname = "强力"},
					    { itemid = 10107, itemname = "法术连击"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 10 then 
			    local ItemListZ = {
					    { itemid = 10092, itemname = "幸运"},
					    { itemid = 10094, itemname = "招架"},
					    { itemid = 10109, itemname = "法术波动"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 8 then 
			    local ItemListZ = {
					    { itemid = 10090, itemname = "慧根"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 86 then 
			    local ItemListZ = {
					    { itemid = 10104, itemname = "神佑复生"},
					    { itemid = 60209, itemname = "火属性吸收"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 11 then 
			    local ItemListZ = {
					    { itemid = 10096, itemname = "敏捷"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  elseif player:GetMap_id() == 17 then 
			    local ItemListZ = {
					    { itemid = 10108, itemname = "法术暴击"},
					    { itemid = 60208, itemname = "水属性吸收"},
					    { itemid = 60209, itemname = "火属性吸收"},
					    { itemid = 60210, itemname = "土属性吸收"},
					    { itemid = 60211, itemname = "累属性吸收"}}
			    local rr = RandTable(ItemListZ)
			    ShowHint("\#P发现藏宝地点\#W：恭喜你挖到了一本魔兽要诀！")
			    ShowError(string.format("\#W获得魔兽要诀"))
			    player:GetItems():AddItem(rr.itemid, 1)
			  end
			elseif r < 20 then 
			  local i = math.random(1, 100)
		  	if i < 20 then
			    Item = 20006	--1%金刚石
		      player:GetItems():AddItem(Item, 1)
	        ShowError(string.format("\#W获得%s",GetItemName(Item)))
		  	
		  	elseif i < 40 then
			    Item = 20005	--%2定魂珠
		      player:GetItems():AddItem(Item, 1)
	        ShowError(string.format("\#W获得%s",GetItemName(Item)))
		  
		  	elseif i < 60 then
			    Item = 20004	--7%夜光珠
		      player:GetItems():AddItem(Item, 1)
	        ShowError(string.format("\#W获得%s",GetItemName(Item)))
			
			  elseif i < 80 then
			    Item = 20003	--10%龙鳞
		      player:GetItems():AddItem(Item, 1)
	        ShowError(string.format("\#W获得%s",GetItemName(Item)))
			 
			  elseif i < 100 then
			    Item = 20002	--15%避水珠
		      player:GetItems():AddItem(Item, 1)
	        ShowError(string.format("\#W获得%s",GetItemName(Item)))
	     
	      end
			elseif r < 30 then
			  Item = 30000  --10%金柳露
		    player:GetItems():AddItem(Item, 1)
	      ShowError(string.format("\#W获得%s",GetItemName(Item)))
			elseif r < 35 then
		    Item = RandTable({20251,20252}) -- 20%10级-70级铁
		    player:GetItems():AddItem(Item, 1)
	      ShowError(string.format("\#W获得%s",GetItemName(Item)))
			elseif r < 40 then  -- 75%的5%        50级-70级武器装备
		    Item = RandTable({20450,20451,20452,20459,20460,20461,20468,20469,20470,20477,20478,20479,20486,20487,20488,20495,20496,20497,20504,20505,20506,20513,20514,20515,20522,20523,20524,20531,20532,20533,20540,20541,20542,20549,20550,20551,20552,20558,20559,20560,20561,20567,20568,20569,20570,20576,20577,20578,20579,20587,20588,20589,20590,20591,20592,20593,20594,20600,20601,20602,20603,20611,20612,20613,20614,20615,20616,20617,20618})
		    player:GetItems():AddItem(Item, 1)
	      ShowError(string.format("\#W获得%s",GetItemName(Item)))
  
  	elseif r <= 55 then			-- 20%机率与金钱帮杀手战斗
		    Item = RandTable({60031,60032,60047,60048,60064,60065,60080,60081,60096,60097,60112,60113,60306,60307}) 
		    player:GetItems():AddItem(Item, 1)
	      ShowError(string.format("\#W获得%s",GetItemName(Item)))
	  
	  elseif r <= 60 then
	        local rrr = math.random(1, 180)
			if rrr < 5 then
			  Item = 92011
			  player:GetItems():AddItem(Item, 1)
	          ShowError(string.format("\#W获得%s",GetItemName(Item)))
			  script:Rumor(string.format(" %s \#W在挖宝时意外获得了一个#A %s", player:GetCharNameLink(), GetItemName(Item)),false)
			else
			  Item = RandTable({20075,20076,20091,20092,20107,20108,20123,20124,20139,20140,20155,20156,20171,20172,20187,20188,20203,20204,20219,20220,20235,20236})
		      player:GetItems():AddItem(Item, 1)
	          ShowError(string.format("\#W获得%s",GetItemName(Item)))
			end
	  elseif r <= 70 then			--  10%中毒
		    ShowHint("\#P发现藏宝地点\#W：挖到毒气池，你不幸吸入一些毒气导致气血、内力大减……")
		    player:ChangeHP(-player:GetHP() * 80 / 100)
		    player:ChangeSP(-player:GetSP() * 80 / 100)
	  elseif r <= 80 then	          --  15%获得银票
	      local M = math.random(5000, 15000)  
	      ShowHint(string.format("\#P发现藏宝地点\#W：发现宝箱，打开后获得银两\#G%d",M))
		  player:ChangeSMoney(M,305)
		  ShowError(string.format("\#W获得银两%d",M))
	  else						-- 27%触发邪教护法
		  local map = {	

		  {map_id=1  ,x1=5, y1=10,x2=152,  y2=328, map_name = "建邺城",npc_lv = 0, npc_id = {655,656,657,658}}, --建邺
		  {map_id=7  ,x1=5, y1=10,x2=116,  y2=342, map_name = "傲来国",npc_lv = 0, npc_id = {655,656,657,658}}, --傲来国
		  {map_id=8  ,x1=5, y1=10,x2=88,  y2=271, map_name = "花果山",  npc_lv = 5, npc_id = {655,656,657,658}},  --花果山
		  {map_id=11  ,x1=5, y1=10,x2=123,  y2=402, map_name = "北俱芦洲",npc_lv = 5, npc_id = {655,656,657,658}}, --北俱芦洲
		  {map_id=12  ,x1=5, y1=10,x2=111, y2=396, map_name = "长寿村郊外",npc_lv = 15,npc_id = {655,656,657,658}},  --长寿村郊外
		  {map_id=14  ,x1=5, y1=10,x2=393,  y2=294, map_name = "大唐境外",npc_lv = 15,npc_id = {655,656,657,658}},  -- 大唐境外
		  {map_id=19  ,x1=5, y1=10,x2=197, y2=804, map_name = "大唐国境",npc_lv = 15,npc_id = {655,656,657,658}},  -- 大唐国境	
		  {map_id=84,x1=5, y1=10,x2=94,  y2=278, map_name = "朱紫国",npc_lv = 15,npc_id = {655,656,657,658}},--朱紫国
		  {map_id=86,x1=5, y1=10,x2=112,  y2=348, map_name = "麒麟山",npc_lv = 15,npc_id = {655,656,657,658}},--麒麟山
		  {map_id=6,x1=5,y1=10,x2=97, y2=294, map_name = "江南野外",npc_lv = 15,npc_id = {655,656,657,658}}}--江南野外
		  local map_id, x1, y1,x2,y2,map_name,npc_lv,npc_id
		  local loc = RandTable(map)
			  map_id = loc.map_id
			  x1 = loc.x1
			  y1 = loc.y1
			  x2 = loc.x2
			  y2 = loc.y2
			  map_name = loc.map_name
			  npc_lv = loc.npc_lv

	  	local oneMap = { {  map_id = map_id , x1 = x1, y1 = y1, x2 = x2 - 10 , y2 = y2 -10 }}
		  script:Rumor(string.format("#Y \ %s \#W挖宝时不慎挖塌了妖怪的房子,一群无家可归的妖怪正在\#Y%s#W询衅闹事,各路英雄快前往平乱啊!#46\#W\#G(1线)", 
		  player:GetCharNameLink(), map_name, npc_lv), false)
		  for i = 1, 8 do
			  local loc1 = RandMapLoc(oneMap)
			  if loc1 then
				-- 生成一个新 NPC 在该随机位置上
			    local R = math.random(1,4)
			    npc_id = loc.npc_id[R]
				  script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 1200, 1)
			  end
		  end--]]
		end
  else
	  ShowHint("很遗憾，你的当前包裹已满，所挖宝贝丢失……")
  end
end--]]

























-- CanUse 是用战斗中检查該物品能否使用时 call 的
-- user : 該物品使用的對象，user 是 CBatActor object
-- target : 該物品使用的對象，target 是 CBatActor object
function Item20000:CanUse(user, target)
end

-- BattleUse 是用战斗中使用該物品時 call 的
function Item20000:BattleUse(user, target)
end

-- 必需在脚本最後将物品表加入系统中
AddItemTable(Item20000)
