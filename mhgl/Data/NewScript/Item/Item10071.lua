--author: apollo
--金钱镖：对敌方单个目标造成10点暗器伤害

Item10071 = {
}

function Item10071:MapUse(target)
end

function Item10071:CanUse(user, target)
end

function Item10071:BattleUse(user, target)
	target:ChangeHP(-70)
end

AddItemTable(Item10071)