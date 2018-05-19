--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10067 = {
}

function Item10067:MapUse(target)
end

function Item10067:CanUse(user, target)
end

function Item10067:BattleUse(user, target)
	target:ChangeHP(-30)
end

AddItemTable(Item10067)