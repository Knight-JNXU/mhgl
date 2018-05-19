--author: apollo
--【功效】复活、恢复气血=品质*5+100，临时气血上限变为品质*5+100

Item10049 = {
}

function Item10049:MapUse(target)
	ShowError("只能在战斗中使用！")
end

function Item10049:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	return true
end

function Item10049:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	if target:GetHP() > 0 then
		ShowError("目标还未死亡！")
		return false
	else
		target:ChangeMHP(5 * qual + 100)
		target:ChangeHP(5 * qual + 100)
	end
	--target:AddBuff(52, 0, 0, 0, 999, 100) --复活BUFF
end

AddItemTable(Item10049)