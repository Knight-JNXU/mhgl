--author: apollo
--月华露：令参战状态召唤兽获得一定经验

Item30006 = {
}

function Item30006:MapUse(target)
	local mobid = target:GetMob_id()	
	if target and target:GetUserType() == 2 then --召唤兽	
		if target:GetLock() then 
			ShowHint("已上锁的召唤兽无法使用")
			return
		end	
		if not item:ReduceCount() then return end
		if target:GetLevel() <= 150 then
			target:ChangeExp(100000000)			--!!!!!! 等级变为0级，各项能力重新生成
		else
			target:ChangeExp(100000000)
		end
		ShowHint("你的召唤兽修炼过《月华露》后获益颇多")		
	else
		ShowHint("《月华露》只能对召唤兽使用")
	end
end

function Item30006:CanUse(user, target)
end

function Item30006:BattleUse(user, target)

end

AddItemTable(Item30006)