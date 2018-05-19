--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10065 = {
}

function Item10065:MapUse(target)
end

function Item10065:CanUse(user, target)
end

function Item10065:BattleUse(user, target)
	target:ChangeHP(-3000)
end

AddItemTable(Item10065)