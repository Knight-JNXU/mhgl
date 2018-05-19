--author: apollo
--武学秘籍 指定召唤兽后右击使用：使召唤兽学会"冥思"招式

Item60201 = {
}

function Item60201:MapUse(target)
	if target and target:GetUserType() == 2 then --召唤兽
		if target:GetLock() then 
			ShowHint("已上锁的召唤兽无法使用")
			return
		end	
		if target:GetRace()~= 1 and target:GetRace()~= 2 and target:GetRace()~= 3 and target:GetRace()~= 4 and target:GetRace()~= 11 then
			ShowHint("此类型召唤兽不能学习新的招式")
			return
		end	
		ItemAsk(string.format("你确定要让\#P%s\#W学习武学秘籍吗？", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then				
			local NewSkillID = 273
			local NewSkillName = "烈火"
			if target:HasSkill(NewSkillID) then
				ShowHint(string.format("该召唤兽已经拥有招式\#P%s\#W，无需再次学习", NewSkillName))
				return
			else
				if not item:ReduceCount() then return end
				local skillcount = target:GetNormalSkillCount()
				if skillcount <= 0 then	-- 召唤兽身上没有技能时直接给它新加技能
					target:AddSkill(NewSkillID)
					ShowHint(string.format("恭喜你的召唤兽学会了新的招式\#P%s", NewSkillName))
				elseif target:GetRace()~= 4 and skillcount <= 9 then
					local r = math.random(1, 10)
					if r <= 3 then	-- 30%直接学会新的技能
						target:AddSkill(NewSkillID)
						ShowHint(string.format("恭喜你的召唤兽学会了新的招式\#P%s", NewSkillName))
					else	--70%新的技能后替代原有技能之一
						target:RemoveSkill(target:GetRandomSkillID(0))			--!!!!!!
						target:AddSkill(NewSkillID)
						ShowHint(string.format("你的召唤兽学会了新的招式\#P%s\#W,但似乎遗忘了某个招式", NewSkillName))
					end
				elseif target:GetRace() == 4 and skillcount <= 9 then
					local r = math.random(1, 10)
					if r <= 3 then	-- 30%直接学会新的技能
						target:AddSkill(NewSkillID)
						ShowHint(string.format("恭喜你的召唤兽学会了新的招式\#P%s", NewSkillName))
					else	--70%新的技能后替代原有技能之一
						target:RemoveSkill(target:GetRandomSkillID(0))			--!!!!!!
						target:AddSkill(NewSkillID)
						ShowHint(string.format("你的召唤兽学会了新的招式\#P%s\#W,但似乎遗忘了某个招式", NewSkillName))
					end	
				else	-- 召唤兽身上的技能大于等于3个时，新学习的技能必定替代原有技能之一
					target:RemoveSkill(target:GetRandomSkillID(0))				--!!!!!!
					target:AddSkill(NewSkillID)
					ShowHint(string.format("你的召唤兽学会了新的招式\#P%s\#W,但似乎遗忘了某个招式", NewSkillName))
				end
			end
		end
	else
		ShowHint("该目标不能使用")
	end
end

function Item60201:CanUse(user, target)
end

function Item60201:BattleUse(user, target)

end

AddItemTable(Item60201)