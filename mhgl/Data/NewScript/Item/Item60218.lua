Item60218 = {
}

function Item60218:MapUse(target)
	local AvailBackPack = player:GetAvailBackPack() 
	if AvailBackPack <= 2 then
		if not item:ReduceCount() then return end
		player:AddAvailBackPack(1)
		ShowHint("恭喜，你已成功开启了包裹1。")
		ShowError("\#W成功开启包裹1")
	else
		ShowHint("很抱歉，已有包裹个数不为0，无法使用")
	end
end

function Item60218:CanUse(user, target)
end

function Item60218:BattleUse(user, target)

end

AddItemTable(Item60218)