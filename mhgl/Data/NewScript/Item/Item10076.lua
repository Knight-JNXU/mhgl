--author: apollo
--熏香：使用后可取消护身烟的效果

Item10076 = {
}

function Item10076:MapUse(target)
	if not item:ReduceCount() then return end
	
	if player:HasBuff(210) then
		player:RemoveBuff(210)
	end
	
	if player:HasBuff(212) then
		player:RemoveBuff(212)
	end
	
	--[[if player:HasBuff(251) then
		player:RemoveBuff(251)
	end]]
end

function Item10076:CanUse(user, target)
end

function Item10076:BattleUse(user, target)

end

AddItemTable(Item10076)