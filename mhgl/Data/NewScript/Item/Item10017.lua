--author: apollo
--包子:恢复100点生命值。

Item10017 = {
}

function Item10017:MapUse(target)
	if not item:ReduceCount() then return end
	local hp = 100;
	if target:IsBuffExist(278) then
		hp = 100*1.5;
	end
	target:ChangeHP(hp)
	
end

function Item10017:CanUse(user, target)

end

function Item10017:BattleUse(user, target)

end

AddItemTable(Item10017)