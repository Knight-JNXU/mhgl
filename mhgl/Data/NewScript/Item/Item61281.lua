Item61281= {
}

function Item61281:MapUse(target)
  if player:GetChar_id () == 1 then
    player:ChangeToMob(689, 1)
  end


	local PartnerWareHouse = player:GetAvailPartnerWareHouse();
	if PartnerWareHouse < 8 then
		if not item:ReduceCount() then return end
		ShowHint("同伴仓库上限增加1格")
		player:AddAvailPartnerWareHouse(1)
	else
		ShowHint("你的同伴仓库上限已达最大格数")
		
	end
end

function Item61281:CanUse(user, target)
end

function Item61281:BattleUse(user, target)
end

AddItemTable(Item61281)