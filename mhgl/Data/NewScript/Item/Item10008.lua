--author: apollo
--佛光舍利子：【功效】复活、恢复气血=品质*3，临时气血上限变为品质*7+100。

Item10008 = {
}

function Item10008:MapUse(target)
	ShowError("只能在战斗中使用！")
end

function Item10008:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10008:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	local i = math.random(10,20)
	if qual == 0 then
	  qual = i 
	end
	if target:GetHP() > 0 then
		ShowError("目标还未死亡！")
		return false
	else
		target:ChangeMHP(7 * qual + 100)
		target:ChangeHP(3 * qual)
	end
	
	--target:AddBuff(52, 0, 0, 0, 999, 100) --复活BUFF
end

AddItemTable(Item10008)