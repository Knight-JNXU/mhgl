--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10069 = {
}

function Item10069:MapUse(target)
end

function Item10069:CanUse(user, target)
end

function Item10069:BattleUse(user, target)
	target:ChangeHP(-50)
end

AddItemTable(Item10069)