--兵器谱门派闯关任务
-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest63521 = {
	quest_id = 63521,							-- 任务 ID
	type_id = 63521,								-- 大类 ID
	type_name = "周末任务",						-- 大类名称
	name = "门派闯关",					-- 任务名称
	round_info = {limit_round = 300, limit_type = 1},
	time_mark = 63521,							-- 时间标志
	time_limit = 1800,
	require = {minLv = 30},

	require = {minLv = 0},	
	descript = "皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第一关#P大唐官府#W,击败#G大唐官府护法#W,可继续下一关！",	
	target_npc = { {npc_id=300500, map_id=27} },
	target_mob = { {mob_id=466, count=1} },
	end_npc = {npc_id=300512, map_id=34},			
  feature = {"nocancel" ,"failPlayerDie","failEscape"},	
}
function Quest63521:Take()
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
			local q = member:GetQuests():GetQuest(63521)
			if member then			    
				if member:GetLevel() < 40 then
					NpcSayParty(string.format("\#P%s\#W等级不足\#G40\#W级，无法参与活动。", member:GetName()))
					return false
				elseif member:GetVP() < 80 then
					NpcSayParty(string.format("\#P%s\#W体力不足\#G80\#W点，无法参与活动。", member:GetName()))
					return false
				elseif q then
					NpcSayParty(string.format("\#P%s\#W身上已有门派闯关任务，无法再次领取。",member:GetName()))
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
		local q = player:GetQuests():GetQuest(63521)		    
		if player:GetLevel() < 40 then
			NpcSay("等级不足\#G40\#W级，无法参与活动。")
			return false
		elseif q then
			NpcSay("身上已有门派闯关任务，无法再次领取。")
			return false
		end	
	end
	if IsProcess() then 
		script:SetSaying(true)
		  if party then
			  NpcSayParty("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第一关#P大唐官府#W,击败#G大唐官府护法#W,可继续下一关！")
			  AddQuestParty(self)	
	      for i = 0, party:GetRealMemNum() - 1 do
	      local member = party:GetInPartyMember(i)
			    member:ChangeVP(-80)
			  end
		  else
			NpcSay("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第一关#P大唐官府#W,击败#G大唐官府护法#W,可继续下一关！")
			AddQuest(self)
		end
	end
	return true	
end	
function Quest63521:Return()
end
function Quest63521:ReturnInBat(character)
  if character == nil then return false end	
	local q = character:GetQuests():GetQuest(self.quest_id)
	local mobId = q and q:GetTargetMobId(1) or 0
	if mobId == 466 and npc:GetNpc_id() == 300500 then			
	  if IsProcess() then	
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第二关#P化生寺#W,击败#G化生寺护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 467, 1)	
			q:SetTargetNPC(1, 300501,28)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O化生寺")
	elseif mobId == 467 and npc:GetNpc_id() == 300501 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第三关#P普陀山#W,击败#G普陀山护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 468, 1)	
			q:SetTargetNPC(1, 300502,26)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O普陀山")
	elseif mobId == 468 and npc:GetNpc_id() == 300502 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第四关#P阴曹地府#W,击败#G阴曹地府护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 469, 1)	
			q:SetTargetNPC(1, 300503,20)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O阴曹地府")
	elseif mobId == 469 and npc:GetNpc_id() == 300503 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第五关#P龙宫#W,击败#G龙宫护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 470, 1)	
			q:SetTargetNPC(1, 300504,21)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O龙宫")
	elseif mobId == 470 and npc:GetNpc_id() == 300504 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第六关#P女儿村#W,击败#G女儿村护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 471, 1)	
			q:SetTargetNPC(1, 300505,10)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O女儿村")
	elseif mobId == 471 and npc:GetNpc_id() == 300505 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第七关#P天宫#W,击败#G天宫护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 472, 1)	
			q:SetTargetNPC(1, 300506,13)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O天宫")
	
	elseif mobId == 472 and npc:GetNpc_id() == 300506 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第八关#P狮驼岭#W,击败#G狮驼岭护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 473, 1)	
			q:SetTargetNPC(1, 300507,17)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O狮驼岭")

	elseif mobId == 473 and npc:GetNpc_id() == 300507 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第九关#P魔王寨#W,击败#G魔王寨护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 474, 1)	
			q:SetTargetNPC(1, 300508,18)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O魔王寨")



	elseif mobId == 474 and npc:GetNpc_id() == 300508 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第十关#P盘丝岭#W,击败#G盘丝岭护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 475, 1)	
			q:SetTargetNPC(1, 300509,16)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O盘丝岭")


	elseif mobId == 475 and npc:GetNpc_id() == 300509 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第十一关#P五庄观#W,击败#G五庄观护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 476, 1)	
			q:SetTargetNPC(1, 300510,15)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O五庄观")
	
	elseif mobId == 476 and npc:GetNpc_id() == 300510 then
			if IsProcess() then
			q:SetDescription("皇帝圣旨,令各大门派举办护法守卫,江湖人士可进行闯关活动,少侠当前第十二关#P方寸山#W,击败#G方寸山护法#W,可继续活动下一关！")
			q:SetTargetMOB(1, 477, 1)	
			q:SetTargetNPC(1, 300511,29)
			q:UpdateData()	
		end	
		character:GetScript():ShowHint("挑战成功,下一关:\#O\#O方寸山")
	elseif mobId == 477 and npc:GetNpc_id() == 300511 then
	  if IsProcess() then	
	    q:ResetTarget()
		  q:SetDescription("恭喜各位全部通关,请到门派闯关使者处可领取下一轮门派活动！")
		  q:SetTargetNPC(1, 300512, 34) 
		  q:UpdateData()
	  	for i = 0, party:GetRealMemNum() - 1 do
		  	local member = party:GetInPartyMember(i)
		    member:GetQuests():RemoveQuest(63521)
		  end
    end
	  character:GetScript():ShowHint("恭喜你，通关成功！可到门派闯关使者处继续领取下一轮门派闯关任务")
	end
end




AddQuestTable(Quest63521)
