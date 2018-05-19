--author: apollo
--【功效】恢复魔法=品质*3+50，恢复灵力=品质*0.3

Item10029 = {
}

function Item10029:MapUse(target)
	if not item:ReduceCount() then return end	
	local qual = item:GetItem_quality()
	target:ChangeSP(3 * qual + 50 )
end

function Item10029:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10029:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	target:ChangeSP(3 * qual + 50 )
	--target:AddBuff(52, 0, 0, 0, 999, 100) --复活BUFF
end

AddItemTable(Item10029)