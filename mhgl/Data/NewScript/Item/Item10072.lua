--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10072 = {
}

function Item10072:MapUse(target)
end

function Item10072:CanUse(user, target)
end

function Item10072:BattleUse(user, target)
	target:ChangeHP(-80)
end

AddItemTable(Item10072)