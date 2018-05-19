Item60003= {
}

function Item60003:MapUse(target)
	if item == nil then return end
	local money = item:GetItemValue1() * 10000 + item:GetItemValue2()
	local flag = item:GetItemValue3()
	if flag > 0 then
		money = 30000 - money
	else
		money = 30000 + money
	end
	ShowHint(string.format("商票中所存银两:\#G%d\#W", money))
end

function Item60003:CanUse(user, target)
end

function Item60003:BattleUse(user, target)
end

AddItemTable(Item60003)