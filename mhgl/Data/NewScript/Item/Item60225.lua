--author: apollo
--十步一杀：提高遇敌率速度，十步以内必然遇敌

Item60225 = {
}

function Item60225:MapUse(target)
	if player:HasBuff(300) then
		ShowHint("已有三倍帮贡效果")
	else
		if not item:ReduceCount() then return end
		
		player:AddBuff(300, 0, 0, 0, 60, 100) --避敌BUFF
		ShowHint("使用了三倍帮贡，获得\#G60\#W分钟 帮派任务获得三倍帮贡效果")	
	end
end

function Item60225:CanUse(user, target)
end

function Item60225:BattleUse(user, target)

end

AddItemTable(Item60225)