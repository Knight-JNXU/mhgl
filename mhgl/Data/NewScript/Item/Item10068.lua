--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10068 = {
}

function Item10068:MapUse(target)
end

function Item10068:CanUse(user, target)
end

function Item10068:BattleUse(user, target)
	target:ChangeHP(-40)
end

AddItemTable(Item10068)