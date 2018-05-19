--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60217 = {
}

function Item60217:MapUse(target)
	local MaxPartner = player:GetMaxPartner()
	if MaxPartner <= 7 then
		if not item:ReduceCount() then return end
		
		player:SetMaxPartner(MaxPartner+1)
		ShowHint(string.format("恭喜，你可携带的召唤兽个数由%s个上升至\#G%s\#W个。",MaxPartner,MaxPartner+1))
	else
		ShowHint(string.format("很抱歉，你现在可携带召唤兽的个数为\#G%d\#W个，无法使用神奇葫芦。", MaxPartner))
	end
end

function Item60217:CanUse(user, target)
end

function Item60217:BattleUse(user, target)

end

AddItemTable(Item60217)