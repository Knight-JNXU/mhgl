--author: apollo
--阵法秘籍 人物右击使用：学会真武七截阵

Item51308 = {
}

function Item51308:MapUse(target)
	if target and target:GetUserType() == 1 then --人物
		local NewSkillID = 9
		local NewSkillName = "《龙飞阵》"
		if target:HasSkill(NewSkillID) then
			ShowHint(string.format("您已经学会了\#P%s\#W，无需再次学习", NewSkillName))
			return
		else
			local j = 0;
			for i = 1, 13 do
				if target:HasSkill(i) then
					j = j + 1;
				end
			end
			if j > 4 then
				ShowHint("你已经学满了5种阵法，不能继续学习。")
				return
			else
				if not item:ReduceCount() then return end
				target:AddSkill(NewSkillID)
				ShowHint(string.format("恭喜你学会了新的阵法\#P%s", NewSkillName))
			end
		end
	else
		ShowHint("该目标不能使用")
	end
end

function Item51308:CanUse(user, target)
end

function Item51308:BattleUse(user, target)

end

AddItemTable(Item51308)