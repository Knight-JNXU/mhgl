Item61280= {
}

function Item61280:MapUse(target)
	local ItemWareHouse = player:GetAvailItemWareHouse();
	if ItemWareHouse < 4 then
		if not item:ReduceCount() then return end
		ShowHint("物品仓库上限增加24格")
		player:AddAvailItemWareHouse(1)
	else
		ShowHint("你的物品仓库上限已达最大格数")
	end
end

function Item61280:CanUse(user, target)
end

function Item61280:BattleUse(user, target)
end

AddItemTable(Item61280)