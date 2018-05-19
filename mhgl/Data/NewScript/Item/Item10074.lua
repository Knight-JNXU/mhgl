--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10074 = {
}

function Item10074:MapUse(target)
end

function Item10074:CanUse(user, target)
end

function Item10074:BattleUse(user, target)
	target:ChangeHP(-300)
end

AddItemTable(Item10074)