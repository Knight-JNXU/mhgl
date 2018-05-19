-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest26002 = {
	quest_id = 26002,							-- 任务 ID
	type_id = 26,								-- 大类 ID
	type_name = "任务链",
	round_info = {max_round = 300,limit_type = 2}, 
	name = "千里传信",							-- 任务名称
	feature = { "nocancel"},		-- 任务特性
}
-- Quest26002 拿取任务方法
function Quest26002:Take()
	if not HasQuest(26002) then	
		local npcList = {}
	  npcList = {
			    {npc_id = 34,   map_id = 2},--东海湾
			    {npc_id = 28,   map_id = 2},
			    {npc_id = 49,   map_id = 6},--江南野外
			    {npc_id = 65,   map_id = 7},--傲来国
			    {npc_id = 85,   map_id = 8},--花果山
			    {npc_id = 86,   map_id = 8},
			    {npc_id = 80,   map_id = 10},--女儿村
			    {npc_id = 81,   map_id = 10},
			    {npc_id = 82,   map_id = 10},
			    {npc_id = 79,   map_id = 10},
			    {npc_id = 100,   map_id = 11},--北俱芦洲
			    {npc_id = 98,   map_id = 11},
			    {npc_id = 96,   map_id = 11},
			    {npc_id = 101,   map_id = 11},
			    {npc_id = 97,   map_id = 11},
			    {npc_id = 99,   map_id = 11},
			    {npc_id = 109,   map_id = 12},--长寿村郊外
			    {npc_id = 111,   map_id = 12},
			    {npc_id = 110,   map_id = 12},
			    {npc_id = 108,   map_id = 12},
			    {npc_id = 121,   map_id = 13},--天宫
			    {npc_id = 122,   map_id = 13},
			    {npc_id = 124,   map_id = 13},
			    {npc_id = 158,   map_id = 14},--大唐境外
			    {npc_id = 127,   map_id = 14},
			    {npc_id = 157,   map_id = 14},
			    {npc_id = 133,   map_id = 14},
			    {npc_id = 153,   map_id = 14},
			    {npc_id = 134,   map_id = 14},
			    {npc_id = 132,   map_id = 14},
			    {npc_id = 131,   map_id = 14},
			    {npc_id = 161,   map_id = 14},
			    {npc_id = 136,   map_id = 14},
			    {npc_id = 137,   map_id = 14},
			    {npc_id = 135,   map_id = 14},
			    {npc_id = 160,   map_id = 14},
			    {npc_id = 138,   map_id = 14},
			    {npc_id = 145,   map_id = 14},
			    {npc_id = 141,   map_id = 14},
			    {npc_id = 144,   map_id = 14},
			    {npc_id = 147,   map_id = 14},
			    {npc_id = 146,   map_id = 14},
			    {npc_id = 151,   map_id = 14},
			    {npc_id = 148,   map_id = 14},
			    {npc_id = 149,   map_id = 14},
			    {npc_id = 197,   map_id = 19},--大唐国境
			    {npc_id = 188,   map_id = 19},
			    {npc_id = 195,   map_id = 19},
			    {npc_id = 204,   map_id = 20},--地府
			    {npc_id = 202,   map_id = 20},
			    {npc_id = 203,   map_id = 20},
			    {npc_id = 209,   map_id = 21},--龙宫
			    {npc_id = 216,   map_id = 21},
			    {npc_id = 213,   map_id = 21},
			    {npc_id = 210,   map_id = 21},
			    {npc_id = 230,   map_id = 26},--普陀山
			    {npc_id = 227,   map_id = 26},
			    {npc_id = 228,   map_id = 26},
			    {npc_id = 235,   map_id = 28},--化生寺
			    {npc_id = 238,   map_id = 28},
			    {npc_id = 239,   map_id = 28},
			    {npc_id = 241,   map_id = 29},--方寸山
			    {npc_id = 242,   map_id = 29},
			    {npc_id = 488,   map_id = 84},--朱紫国
			    {npc_id = 489,   map_id = 84},
			    {npc_id = 550,   map_id = 108},--长寿村
			    {npc_id = 567,   map_id = 108},
			    {npc_id = 560,   map_id = 108},
			    {npc_id = 561,   map_id = 108},
			    {npc_id = 564,   map_id = 108},
			    {npc_id = 565,   map_id = 108}}
	for m = 1, 1000 do
			local npcId = npc and npc:GetNpc_id() or 0			
			local r = RandTable(npcList)				-- 随机从 table 中取一个 object
			local npcName = GetNpcName(r.npc_id)
			if r.npc_id ~= npcId then	
			  self.target_npc = { r }
			  local A = math.random(1,2)
			  if A == 1 then
			    self.descript = string.format("许久没有见过\#A%s#W了,前去找到他叙叙旧吧~。",npcName)
			  elseif A == 2 then
			    self.descript = string.format("告诉\#A%s#W,他的东西已经做好,近日会给他送过来~",npcName)
			  end
			 
			 
			  self.end_npc = { npc_id = r.npc_id, map_id = r.map_id }
			  NpcSay("很久没有跟老朋友叙叙旧了,帮我找到老朋友让他过来跟我叙叙旧吧~")
			  AddQuest(self)
			  return
			end
    end
  else
    NpcSay("先把手里的事办完了再说吧。")
  end
end

function Quest26002:TakeAgain()
	local qtype = player:GetQuests():GetType(self.type_id)
	local quest26006 = player:GetQuests():GetQuest(26006) 
	local npcId = quest26006:GetEndNpcId()
	local round = qtype:GetRound()
	local mapId = quest26006:GetEndMapId()
	local npcName = GetNpcName(npcId)	
	player:GetQuests():RemoveQuest(26006) 
	
	self.target_npc = {{npc_id = npcId, map_id = mapId}}
	self.descript = string.format("找到\#A%s\#W。",npcName)
	self.end_npc = { npc_id = npcId, map_id = mapId }
	AddQuest(self)
	qtype:SetRound(round)
	player:GetQuests():GetQuest(26002):UpdateData()--]]
end
	
	
	
-- Quest26002 交回任务方法			
function Quest26002:Return()
	if player:GetQuests():GetQuest(26002):IsFailed() then
		NpcSay("任务已失败，可在陆萧然处删除任务。")
		return
	end
	if  not QuestCompleted(self) then		
		NpcSay("话传到了吗？")
		return false
	else
		local qtype = player:GetQuests():GetType(self.type_id)
		if qtype == nil then return false end
		local round = qtype:GetRound()
		local quest = player:GetQuests():GetQuest(self.quest_id)
		local freeSlot = player:GetItems():GetFreeSlot(0)
		local rexp = math.random(9500,10500)/10000
		local lv = player:GetLevel()
		local Exp = 0
		local buff = player:HasBuff(218) and 2 or 1
		if player:HasBuff(219) then
			buff = 3
		end

		--标准经验
	    local EPH =(4 * lv + 10) * 6.6 * 70
	    --经验系数
	   -- local coExp = 50
		--local round1 = 5+math.floor((round-1)/10)
		--local round2 = 9+round-(round1-5)*10
	local q = math.random(50,60) / 10
	Exp = math.floor(EPH * buff) * 5
	Exp = Exp + (Exp*round/200)
	
	    local i = math.random(1,2)
		if IsProcess() then	
			script:SetSaying(true)
					if round == 50  then
						if player:GetItems():GetFreeSlot(0) < 1 then
							NpcSay(string.format("请整理你的当前包裹，至少预留1个位置。"))
							return 
						end
						local i = math.random(1,2)
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600032})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					
					  end
					elseif round == 100  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600016})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
		
					  end
					elseif round == 150  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600017})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 200  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600033})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 250  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600033})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 300  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600017})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					end
					local p = math.random(1,100)
					local pp = math.random(1,100)
					local itemN = 1
					if p < 3 then
					  item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091})
					  if pp == 98 then
					     item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091,92001,92002,92003,92004,92005})
					  end
					  if item > 15005 and item < 15010 then
					     itemN = math.random(1,3)
					  end
					  if item == 80053 then
					     itemN = math.random(1,3)
					  end
					  name = GetItemName(item)
					  ShowError(string.format("\#W获得%s",name))
					  script:Rumor(string.format("\#W%s\#O在跑环过程中，意外获得了NPC奖励的\#B%d\#O个\#B%s\。", player:GetName(),itemN, name), false)	
					  player:GetItems():AddItem(item, itemN)
					end
			player:ChangeExp(Exp)
			local money = lv * 100 * 0.7 * math.random(2,3)
			player:ChangeMoney(money,303)
			ShowError(string.format("\#W获得经验值%d",Exp))
			ShowError(string.format("\#W获得银两%d",money))
			local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数 BB进阶专用
	        player:GetQuests():SetFlag(55201, QuestFlagA + 1) -- 任务链计数 BB进阶专用
			NpcSay("有劳了。")
			RemoveQuest(self)
			if round >= 300  then
				NpcSay("辛苦了，所有的事情都忙完了。")
				player:GetQuests():RemoveQuest(26002)
				qtype:SetRound(0)
				return
			end
			local i = math.random(1,2)
			if i == 1 then  
			  Quest26001:Take()
			elseif i == 2 then
			  Quest26002:Take()
			end
	  end
	end
end
-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest26002)














			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
