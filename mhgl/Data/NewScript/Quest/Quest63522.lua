--兵器谱门派闯关任务
-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest63522 = {
	quest_id = 63522,							-- 任务 ID
	type_id = 63522,								-- 大类 ID
	type_name = "锁妖塔任务",						-- 大类名称
	name = "锁妖塔任务",					-- 任务名称
	round_info = {limit_round = 1, limit_type = 1},
	time_mark = 63522,							-- 时间标志
	time_limit = 1800,
	require = {minLv = 30},

	require = {minLv = 0},	
	descript = "击败",	
	target_npc = { {npc_id=800011, map_id=2016} },
	target_mob = { {mob_id=800011, count=1} },
	end_npc = {npc_id=700002, map_id=56300},			
  feature = {"nocancel" ,"failPlayerDie","failEscape"},	
}
function Quest63522:Take()
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
			local q = member:GetQuests():GetQuest(63522)
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
		local q = player:GetQuests():GetQuest(63522)		    
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
function Quest63522:Return()
end
function Quest63522:ReturnInBat(character)
  if character == nil then return false end	
	local q = character:GetQuests():GetQuest(self.quest_id)
	local mobId = q and q:GetTargetMobId(1) or 0
	if mobId == 800011 and npc:GetNpc_id() == 800011 then			
	  if IsProcess() then	
			q:SetDescription("击败")
			q:SetTargetMOB(1, 800012, 1)	
			q:SetTargetNPC(1, 800012,2017)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 800012 and npc:GetNpc_id() == 800012 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 800013, 1)	
			q:SetTargetNPC(1, 800013 ,2018)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 800013 and npc:GetNpc_id() == 800013 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 800014 , 1)	
			q:SetTargetNPC(1, 800014 , 2020)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功")
	elseif mobId == 800014 and npc:GetNpc_id() == 800014 then
			if IsProcess() then
			q:SetDescription("击败")
			q:SetTargetMOB(1, 800015, 1)	
			q:SetTargetNPC(1, 800015 ,2021)
			q:UpdateData()	
		end	
		elseif mobId == 800015 and npc:GetNpc_id() == 800015 then
	  if IsProcess() then	
	    q:ResetTarget()
		  q:SetDescription("恭喜各位全部通关")
		  q:SetTargetNPC(1, 700002, 56300) 
		  q:UpdateData()
	  	for i = 0, party:GetRealMemNum() - 1 do
		  	local member = party:GetInPartyMember(i)
		    member:GetQuests():RemoveQuest(63522)
		  end
    end
	  character:GetScript():ShowHint("恭喜你")
	end

end


AddQuestTable(Quest63522)
