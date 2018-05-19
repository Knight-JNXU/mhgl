--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10070 = {
}

function Item10070:MapUse(target)
end

function Item10070:CanUse(user, target)
end

function Item10070:BattleUse(user, target)
	target:ChangeHP(-60)
end

AddItemTable(Item10070)