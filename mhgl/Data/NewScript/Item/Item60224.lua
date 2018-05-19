--author: apollo
--十步一杀：提高遇敌率速度，十步以内必然遇敌

Item60224 = {
}

function Item60224:MapUse(target)
	if player:HasBuff(279) then
		ShowHint("已有双倍帮贡效果")
	else
		if not item:ReduceCount() then return end
		
		player:AddBuff(279, 0, 0, 0, 60, 100) --避敌BUFF
		ShowHint("使用了双倍帮贡，获得\#G60\#W分钟 帮派任务获得双倍帮贡效果")	
	end
end

function Item60224:CanUse(user, target)
end

function Item60224:BattleUse(user, target)

end

AddItemTable(Item60224)