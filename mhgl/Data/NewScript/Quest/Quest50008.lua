-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest50008 = {
	quest_id = 50008,							-- 任务 ID
	type_id = 500,								-- 大类 ID
	type_name = "每周活动",
	name = "科举考试（武试）",							-- 任务名称
	feature = { "nocancel"}					-- 任务特性
}

-- Quest50008 拿取任务方法
function Quest50008:Take()
	--[[if not IsProcess() then
		return true
	end
	script:SetSaying(true)
	local npcList = {
					{npc_id = 134, map_id = 20302, x=23, y=67},
					{npc_id = 361, map_id = 20303, x=14, y=56},
					{npc_id = 338, map_id = 20304, x=12, y=49},
					--{npc_id = 636, map_id = 20306, x=48, y=98},
					{npc_id = 80,  map_id = 20307, x=20, y=59},
					{npc_id = 348, map_id = 20308, x=9, y=77},					
					{npc_id = 324, map_id = 20309, x=30, y=38},					
					{npc_id = 188, map_id = 20310, x=31, y=40},
					{npc_id = 136, map_id = 20311, x=18, y=51}
					}
	local moblist = { 	
					{mob_id=3,map_id=100},		
					{mob_id=6,map_id=200},
		            {mob_id=9,map_id=300},	
					{mob_id=10,map_id=300},	
		            {mob_id=12,map_id=400},
		            {mob_id=15,map_id=500},
					{mob_id=18,map_id=500},
					{mob_id=20,map_id=700},
					{mob_id=21,map_id=700},
					{mob_id=23,map_id=600},
					{mob_id=24,map_id=600}}
	for m = 1, 1000 do
		local r = RandTable(npcList)
		local R = RandTable(moblist)
		local t = RandTable(endnpc)
	    local npcId = npc and npc:GetNpc_id() or 0
	    if r.npc_id ~= npcId then
		    local npcName = GetNpcName(r.npc_id)		
			local mapName = GetMapName(r.map_id)
			local mobName = GetMobName(R.mob_id)
			local mobMap = GetMapName(R.map_id)
			local Quest = player:GetQuests():GetQuest(50008) 
			local flag = player:GetQuests():GetFlag(50008)
			if Quest == nil and flag == 0 then
			    player:GetQuests():SetFlag(50008,1)
				flag = player:GetQuests():GetFlag(50008)
				NpcSay(string.format("请在最短的时间内找到\#A%s\#W。",npcName))
				self.descript = string.format("第\#P%d\#W关，在最短的时间内找到\#A%s\#W。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。",flag,npcName)
				self.target_npc = { r }
				self.end_npc = {npc_id = 300080, map_id = 20300, x = 32, y = 200}
				player:GetQuests():SetTimeMark(50008)
				AddQuest(self)
			elseif flag == 13 then
				player:GetQuests():SetFlag(50008,flag+1)
				flag = player:GetQuests():GetFlag(50008)
				NpcSay("做得不错。")
				NpcSay(string.format("现在在最短的时间内抓到\#A%s\#W。",mobName))
				self.descript = string.format("第\#P%d\#W关，去\#P%s\#W抓一个\#A%s\#W回来##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。",flag-1,mobMap,mobName)
				self.target_partner = {{ mob_id = R.mob_id}}
				self.end_npc = {npc_id = 300080, map_id = 20300, x = 32, y = 200}
				AddQuest(self)
			elseif flag == 12 then
			    NpcSay("好了，现在回去武考官吧。")
				player:GetQuests():SetFlag(50008,flag+1)
			    Quest:SetDescription("请尽快向武考官复命。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。")
				Quest:SetTargetNPC(1,300080,20300,32,200)
				Quest:SetEndNPC(300080, 20300, 32,200)
				Quest:UpdateData()
				Quest50008:Return()	
			elseif flag < 12 then
			    player:GetQuests():SetFlag(50008,flag+1)
				flag = player:GetQuests():GetFlag(50008)
			    NpcSay(string.format("请在最短的时间内找到\#A%s\#W。",npcName))
			    Quest:SetDescription(string.format("第\#P%d\#W关，在最短的时间内找到\#A%s\#W。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。",flag,npcName))
				Quest:SetTargetNPC(1,r.npc_id,r.map_id,r.x,r.y)
				Quest:SetEndNPC(300080, 20300, 32,200)
				Quest:UpdateData()
				Quest50008:Return()
			end
			return true
		end	       
	end
	return false]]--	
end

--[[function Quest50008:Return() --找人奖励
	local flag = player:GetQuests():GetFlag(50008)
	local Lv = player:GetLevel()
	local Exp = (4*Lv+10)*6.6*40*(7+flag-1)/357
	player:ChangeExp(Exp,500)
	player:GetScript():ShowError(string.format("\#W获得经验%d",Exp))
	local T = math.random(1, 100)
	if T == 50 then
		local item = {
				    {item_id = 51074,item_name = "藏宝图"},
					{item_id = 41400,item_name = "白铁精英"},
					{item_id = 61006,item_name = "高级护身烟"}}
					
		local r = RandTable(item)		
		if player:GetItems():AddItem(r.item_id) then
			player:ShowRumor(string.format("\#W%s\#O智勇过人，深得考官赏识，特赠送\#B%s\#O以示嘉奖。",player:GetName(),r.item_name),true)
		end
    end
end

function Quest50008:PartnerReturn() --捉同伴奖励
	local moblist = { 	
					{mob_id=3,map_id=100},		
					{mob_id=6,map_id=200},
		            {mob_id=9,map_id=300},	
					{mob_id=10,map_id=300},	
		            {mob_id=12,map_id=400},
		            {mob_id=15,map_id=500},
					{mob_id=18,map_id=500},
					{mob_id=20,map_id=700},
					{mob_id=21,map_id=700},
					{mob_id=23,map_id=600},
					{mob_id=24,map_id=600}}
	local R = RandTable(moblist)				
	local q = player:GetQuests():GetQuest(self.quest_id)
	local mobName = GetMobName(R.mob_id)
	local mobMap = GetMapName(R.map_id)
	local Quest = player:GetQuests():GetQuest(50008) 
	local mob_id = Quest:GetTargetPartnerId(1)
	local reqTbl = { {gtype = 2, gid = mob_id}} 
	local partner = GetMobName(mob_id)
	local givenMsg = "请将任务需求的同伴放入给予界面"
	local success = AskGiven(givenMsg, reqTbl)
	local flag = player:GetQuests():GetFlag(50008)
		if Quest:GetTargetPartnerNum(1) == 0 then 
			NpcSay("抓住他们了吗？")
		    return false 
		end
		if not IsProcess() then
			return true
		end
		if not success then
			return false
		end		
		script:SetSaying(true)
		local Lv = player:GetLevel()
		local Exp = (4*Lv+10)*6.6*40*(7+flag-3)/357
		player:ChangeExp(Exp,500)
		player:GetScript():ShowError(string.format("\#W获得经验%d",Exp))
		local T = math.random(1, 100)
		if T == 50 then
			local item = {
					    {item_id = 51074,item_name = "藏宝图"},
						{item_id = 41400,item_name = "白铁精英"},
						{item_id = 61006,item_name = "高级护身烟"}}
						
			local r = RandTable(item)		
			if player:GetItems():AddItem(r.item_id) then
				player:ShowRumor(string.format("\#W%s\#O智勇过人，深得考官赏识，特赠送\#B%s\#O以示嘉奖。",player:GetName(),r.item_name),true)
			end
	    end
		RemoveAllGiven()
		player:GetQuests():SetFlag(50008,flag+1)
		if flag == 17 then
			NpcSay("下面去挑战下四大将领吧。")
			player:GetQuests():RemoveQuest(50008)
			player:GetQuests():SetFlag(50008,flag+1)	
			self.descript = "第\#P17\#W关，去京城挑战苍龙将领。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。"
			self.target_npc = {{npc_id = 300081, map_id = 20300, x=227, y=187}}
			self.end_npc = {npc_id = 300081, map_id = 20300, x = 227, y = 187}
			AddQuest(self)
		else
			NpcSay(string.format("做得不错，再去捉个\#A%s\#W回来。",mobName))
			Quest:SetDescription(string.format("第\#P%d\#W关，去\#P%s\#W抓一个\#A%s\#W回来##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。",flag,mobMap,mobName))
			Quest:SetTargetPartner(1,R.mob_id,1,0,0,0)
			Quest:SetEndNPC(300080, 20300, 32,200)
			Quest:UpdateData()
		end
end

function Quest50008:BattleReturn(character) --战斗奖励
if character == nil then return false end	
    local flag = player:GetQuests():GetFlag(50008)
	local q = character:GetQuests():GetQuest(self.quest_id)
	local npcId = q and q:GetTargetNpcId(1) or 0
	local Lv = player:GetLevel()
	local Exp = (4*Lv+10)*6.6*40*(7+flag-1)/357
	if npcId == 300081 then
	    q:SetDescription("第\#P18\#W关，去京城挑战白虎将领。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。") 
		q:SetTargetNPC(1,300082,20300,46,550)
		q:SetEndNPC(300082,20300,46,550)
		q:SetTargetMOB(1, 2083, 1)	
	    q:UpdateData()
		player:GetQuests():SetFlag(50008,flag+1)
		Exp = (4*Lv+10)*6.6*40*(7+17)/357
	elseif npcId == 300082 then
	    q:SetDescription("第\#P19\#W关，去京城挑战朱雀将领。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。") 
		q:SetTargetNPC(1,300083,20300,222,543)
		q:SetEndNPC(300083,20300,222,543)
		q:SetTargetMOB(1, 2085, 1)	
	    q:UpdateData()
		player:GetQuests():SetFlag(50008,flag+1)
		Exp = (4*Lv+10)*6.6*40*(7+18)/357
	elseif npcId == 300083 then
	    q:SetDescription("第\#P20\#W关，去京城挑战玄武将领。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。") 
		q:SetTargetNPC(1,300084,20300,103,303)
		q:SetEndNPC(300084,20300,103,303)
		q:SetTargetMOB(1, 2087, 1)	
	    q:UpdateData()
		player:GetQuests():SetFlag(50008,flag+1)
		Exp = (4*Lv+10)*6.6*40*(7+19)/357
	elseif npcId == 300084 then
	    q:SetDescription("挑战完四大将领了，现在去向武考官复命吧。##可以在京城找武考官退出武试，每次活动可以最多进行三次武试。活动结束后可以在京城找丁敖删除任务。") 
		q:SetTargetNPC(1,300080,20300,32,200)
		q:SetEndNPC(300080,20300,32,200)
	    q:UpdateData()
		player:GetQuests():SetFlag(50008,flag+1)
		Exp = (4*Lv+10)*6.6*40*(7+20)/357
	end

	player:ChangeExp(Exp,500)
	player:GetScript():ShowError(string.format("\#W获得经验%d",Exp))
	local T = math.random(1, 100)
	if T == 50 then 
		local item = {
				    {item_id = 51074,item_name = "藏宝图"},
					{item_id = 41400,item_name = "白铁精英"},
					{item_id = 61006,item_name = "高级护身烟"}}
					
		local r = RandTable(item)		
		if player:GetItems():AddItem(r.item_id) then
			player:ShowRumor(string.format("\#W%s\#O智勇过人，深得考官赏识，特赠送\#B%s\#O以示嘉奖。",player:GetName(),r.item_name),true)
		end
    end
end]]

-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest50008)
