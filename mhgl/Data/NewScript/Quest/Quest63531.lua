--兵器谱门派闯关任务
-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest63531 = {
	quest_id = 63531,							-- 任务 ID
	type_id = 63531,								-- 大类 ID
	type_name = "单人副本任务",						-- 大类名称
	name = "单人副本",					-- 任务名称
	round_info = {limit_round = 1, limit_type = 1},
	time_mark = 63531,							-- 时间标志
	time_limit = 1800,
	require = {minLv = 30},

	require = {minLv = 0},	
	descript = "他们每个人都在说谎",	
	target_npc = { {npc_id=350080, map_id=30902} },
	target_mob = { {mob_id=350080, count=1} },
	end_npc = {npc_id=347, map_id=34},			
  feature = {"nocancel" ,"failPlayerDie","failEscape"},	
}
function Quest63531:Take()
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
			local q = member:GetQuests():GetQuest(63531)
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
		local q = player:GetQuests():GetQuest(63531)		    
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
			  NpcSayParty("他们每个人都在说谎")
			  AddQuestParty(self)	
	      for i = 0, party:GetRealMemNum() - 1 do
	      local member = party:GetInPartyMember(i)
			    member:ChangeVP(-80)
			  end
		  else
			NpcSay("他们每个人都在说谎")
			AddQuest(self)
		end
	end
	return true	
end	
function Quest63531:Return()
end
function Quest63531:ReturnInBat(character)
  if character == nil then return false end	
	local q = character:GetQuests():GetQuest(self.quest_id)
	local mobId = q and q:GetTargetMobId(1) or 0
	if mobId == 350080 and npc:GetNpc_id() == 350080 then			
	  if IsProcess() then	
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350081, 1)	
			q:SetTargetNPC(1, 350081,30902)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 350081 and npc:GetNpc_id() == 350081 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350082, 1)	
			q:SetTargetNPC(1, 350082 ,30902)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 350082 and npc:GetNpc_id() == 350082 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350083 , 1)	
			q:SetTargetNPC(1, 350083 , 30902)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 350083 and npc:GetNpc_id() == 350083 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350084, 1)	
			q:SetTargetNPC(1, 350084 ,30902)
			q:UpdateData()	
		end	
			elseif mobId == 350084 and npc:GetNpc_id() == 350084 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350085, 1)	
			q:SetTargetNPC(1, 350085 ,30902)
			q:UpdateData()	
		end	
		elseif mobId == 350085 and npc:GetNpc_id() == 350085 then
		if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350086, 1)	
			q:SetTargetNPC(1, 350086 ,30902)
			q:UpdateData()	
		end	
		elseif mobId == 350086 and npc:GetNpc_id() == 350086 then
		if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350087, 1)	
			q:SetTargetNPC(1, 350087 ,30902)
			q:UpdateData()	
		end	
		elseif mobId == 350087 and npc:GetNpc_id() == 350087 then
		if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 350088, 1)	
			q:SetTargetNPC(1, 350088 ,30902)
			q:UpdateData()	
		end	
		elseif mobId == 350088 and npc:GetNpc_id() == 350088 then	
	  if IsProcess() then	
	    q:ResetTarget()
		  q:SetDescription("恭喜各位全部通关")
		  q:SetTargetNPC(1, 347, 34) 
		  q:UpdateData()
	  	for i = 0, party:GetRealMemNum() - 1 do
		  	local member = party:GetInPartyMember(i)
		    member:GetQuests():RemoveQuest(63531)
		  end
    end
	  character:GetScript():ShowHint("恭喜你")
	end

end


AddQuestTable(Quest63531)
