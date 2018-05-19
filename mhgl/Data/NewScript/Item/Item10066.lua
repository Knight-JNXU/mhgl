--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10066 = {
}

function Item10066:MapUse(target)
end

function Item10066:CanUse(user, target)
end

function Item10066:BattleUse(user, target)
	target:ChangeHP(-20)
end

AddItemTable(Item10066)