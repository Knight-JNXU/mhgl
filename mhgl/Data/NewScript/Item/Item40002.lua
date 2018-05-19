--author: apollo
--武学秘籍 指定宝宝后右击使用：使宝宝学会真·嗜血狂魔技能

Item40002 = {
}

function Item40002:MapUse(target)
	if target and target:GetUserType() == 2 then --宝宝
		if target:GetLock() then 
			ShowHint("已上锁的宝宝无法使用")
			return
		end	
		if target:GetRace()~= 1 and target:GetRace()~= 2 and target:GetRace()~= 3 and target:GetRace()~= 4 and target:GetRace()~= 11 then
			ShowHint("此类型宝宝不能学习新的技能")
			return
		end	
		ItemAsk(string.format("你确定要让\#P%s\#W学习武学秘籍吗？", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then			
			local NewSkillID = 329
			local NewSkillName = "高级吸血"
			if target:HasSkill(NewSkillID) then
				ShowHint(string.format("该宝宝已经拥有技能\#P%s\#W，无需再次学习", NewSkillName))
				return
			else
				if not item:ReduceCount() then return end
				local skillcount = target:GetNormalSkillCount()
				if skillcount <= 0 then	-- 宝宝身上没有技能时直接给它新加技能
					target:AddSkill(NewSkillID)
					ShowHint(string.format("恭喜你的宝宝学会了新的技能\#P%s", NewSkillName))
				elseif target:GetRace()~= 4 and skillcount <= 9 then
					local r = math.random(1, 10)
					if r <= 5 then	-- 30%直接学会新的技能
						target:AddSkill(NewSkillID)
						ShowHint(string.format("恭喜你的宝宝学会了新的技能\#P%s", NewSkillName))
					else	--70%新的技能后替代原有技能之一
						target:RemoveSkill(target:GetRandomSkillID(0))			--!!!!!!
						target:AddSkill(NewSkillID)
						ShowHint(string.format("你的宝宝学会了新的技能\#P%s\#W,但似乎遗忘了某个技能", NewSkillName))
					end
				elseif target:GetRace() == 4 and skillcount <= 9 then
					local r = math.random(1, 10)
					if r <= 5 then	-- 30%直接学会新的技能
						target:AddSkill(NewSkillID)
						ShowHint(string.format("恭喜你的宝宝学会了新的技能\#P%s", NewSkillName))
					else	--70%新的技能后替代原有技能之一
						target:RemoveSkill(target:GetRandomSkillID(0))			--!!!!!!
						target:AddSkill(NewSkillID)
						ShowHint(string.format("你的宝宝学会了新的技能\#P%s\#W,但似乎遗忘了某个技能", NewSkillName))
					end	
				else	-- 宝宝身上的技能大于等于3个时，新学习的技能必定替代原有技能之一
					target:RemoveSkill(target:GetRandomSkillID(0))				--!!!!!!
					target:AddSkill(NewSkillID)
					ShowHint(string.format("你的宝宝学会了新的技能\#P%s\#W,但似乎遗忘了某个技能", NewSkillName))
				end
			end
		end
	else
		ShowHint("该目标不能使用")
	end
end

function Item40002:CanUse(user, target)
end

function Item40002:BattleUse(user, target)

end

AddItemTable(Item40002)