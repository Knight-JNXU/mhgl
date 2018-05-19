--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10073 = {
}

function Item10073:MapUse(target)
end

function Item10073:CanUse(user, target)
end

function Item10073:BattleUse(user, target)
	target:ChangeHP(-90)
end

AddItemTable(Item10073)