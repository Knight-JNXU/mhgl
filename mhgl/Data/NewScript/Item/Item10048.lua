--author: apollo
--【功效】恢复魔法=品质*5+50

Item10048 = {
}

function Item10048:MapUse(target)
	if not item:ReduceCount() then return end	
	local qual = item:GetItem_quality()
	target:ChangeSP(5 * qual + 50 )
end

function Item10048:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10048:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	target:ChangeSP(5 * qual + 50 )
	--target:AddBuff(52, 0, 0, 0, 999, 100) --复活BUFF
end

AddItemTable(Item10048)