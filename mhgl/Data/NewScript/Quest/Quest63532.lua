--兵器谱门派闯关任务
-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest63532 = {
	quest_id = 63532,							-- 任务 ID
	type_id = 63532,								-- 大类 ID
	type_name = "突破任务",						-- 大类名称
	name = "突破任务",					-- 任务名称
	round_info = {limit_round = 1, limit_type = 1},
	time_mark = 63532,							-- 时间标志
	time_limit = 1800,
	require = {minLv = 30},

	require = {minLv = 0},	
	descript = "击败",	
	target_npc = { {npc_id=200000, map_id=53800} },
	target_mob = { {mob_id=200000, count=1} },
	end_npc = {npc_id=200010, map_id=53800},			
  feature = {"nocancel" ,"failPlayerDie","failEscape"},	
}
function Quest63532:Take()
	if party then	
		if party:GetRealMemNum() < 1 then			
			NpcSay("队伍人数不足\#G5\#W人，无法领取任务，请尝试单人领取或\#G5\#W人组队领取。")	
			return false
		end	
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			local qtype = member:GetQuests():GetType(self.type_id)
			if qtype == nil then
				member:GetQuests():SetRoundInfo(self.type_id, 1, 7, 2)
				qtype = member:GetQuests():GetType(self.type_id)
			end
			local q = member:GetQuests():GetQuest(63532)
			if member then			    
				if member:GetLevel() < 40 then
					NpcSayParty(string.format("\#P%s\#W等级不足\#G40\#W级，无法参与活动。", member:GetName()))
					return false
				elseif member:GetVP() < 80 then
					NpcSayParty(string.format("\#P%s\#W体力不足\#G80\#W点，无法参与活动。", member:GetName()))
					return false
				elseif q then
					NpcSayParty(string.format("\#P%s\#W身上已有任务，无法再次领取。",member:GetName()))
					return false
				end
			end		
		end
	else
		local qtype = player:GetQuests():GetType(self.type_id)
		if qtype == nil then
			player:GetQuests():SetRoundInfo(self.type_id, 1, 7, 2)
			qtype = player:GetQuests():GetType(self.type_id)
		end
		local q = player:GetQuests():GetQuest(63532)		    
		if player:GetLevel() < 40 then
			NpcSay("等级不足\#G40\#W级，无法参与活动。")
			return false
		elseif q then
			NpcSay("身上已有任务，无法再次领取。")
			return false
		end	
	end
	if IsProcess() then 
		script:SetSaying(true)
		  if party then
			  NpcSayParty("如果击败可继续下一关！")
			  AddQuestParty(self)	
	      for i = 0, party:GetRealMemNum() - 1 do
	      local member = party:GetInPartyMember(i)
			    member:ChangeVP(-80)
			  end
		  else
			NpcSay("如果击败可继续下一关！")
			AddQuest(self)
		end
	end
	return true	
end	
function Quest63532:Return()
end
function Quest63532:ReturnInBat(character)
  if character == nil then return false end	
	local q = character:GetQuests():GetQuest(self.quest_id)
	local mobId = q and q:GetTargetMobId(1) or 0
	if mobId == 200000 and npc:GetNpc_id() == 200000 then			
	  if IsProcess() then	
			q:SetDescription("击败")
			q:SetTargetMOB(1, 200001, 1)	
			q:SetTargetNPC(1, 200001,53800)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 200001 and npc:GetNpc_id() == 200001 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 200002, 1)	
			q:SetTargetNPC(1, 200002 ,53800)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 200002 and npc:GetNpc_id() == 200002 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 200004 , 1)	
			q:SetTargetNPC(1, 200004 , 53800)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 200004 and npc:GetNpc_id() == 200004 then
	  if IsProcess() then	
	    q:ResetTarget()
		  q:SetDescription("恭喜各位全部通关")
		  q:SetTargetNPC(1, 200010, 53800) 
		  q:UpdateData()
	  	for i = 0, party:GetRealMemNum() - 1 do
		  	local member = party:GetInPartyMember(i)
		    member:GetQuests():RemoveQuest(63532)
		  end
    end
	  character:GetScript():ShowHint("恭喜你")
	end

end


AddQuestTable(Quest63532)
