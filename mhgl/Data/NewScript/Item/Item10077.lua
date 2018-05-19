--author: apollo
--护身烟：使用后30分钟内不会遇到比自己低级的敌人

Item10077 = {
}

function Item10077:MapUse(target)
	if player:HasBuff(212) then
		ShowHint("已有高级护身烟效果")
	else
		if not item:ReduceCount() then return end
		if player:HasBuff(210) then
			player:RemoveBuff(210)
		end
		player:AddBuff(212, 0, 0, 0, 30, 100) --避敌BUFF
		ShowHint("使用了护身烟，获得\#G30\#W分钟避敌效果")	
	end
end

function Item10077:CanUse(user, target)
end

function Item10077:BattleUse(user, target)

end

AddItemTable(Item10077)