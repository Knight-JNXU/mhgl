--author: apollo
--十步一杀：提高遇敌率速度，十步以内必然遇敌

Item60136 = {
}

function Item60136:MapUse(target)
	if player:HasBuff(213) then
	    local Buff213 = player:FindBuff(213)
		local Buff213CoolDown = Buff213:GetBuffCoolDown() 					
		if not item:ReduceCount() then return end
		NewBuff213CoolDown = (Buff213CoolDown + 36000)/60 + 1;
		player:AddBuff(213, 0, 0, 0, NewBuff213CoolDown, 100)
		ShowHint("成功使用物品，增加一小时的十步一杀状态")
	else
		if not item:ReduceCount() then return end
		
		player:AddBuff(213, 0, 0, 0, 3600, 100) --避敌BUFF
		ShowHint("使用了十步一杀，获得\#G60\#W分钟 十步以内必然遇敌的效果")	
	end
end

function Item60136:CanUse(user, target)
end

function Item60136:BattleUse(user, target)

end

AddItemTable(Item60136)