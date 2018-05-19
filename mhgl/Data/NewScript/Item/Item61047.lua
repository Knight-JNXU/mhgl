--author: apollo
--超级摆摊卡：可获得4小时的摆滩时间

Item61047 = {
}

function Item61047:MapUse(target)
	if not item:ReduceCount() then return end
	ShowHint("\W获得合成旗x4")
	ShowHint("\W获得飞行符x30")
	ShowHint("\W获得红罗羹")
	ShowHint("\W获得绿罗羹")
	ShowHint("\W获得绿罗羹")
	ShowHint("\W获得极乐之星x10")
	ShowHint("\W获得新手双倍福利丹x10")
	ShowHint("\W获得护卫令牌x10")
	ShowHint("\W获得角色四倍丹x10")
	ShowHint("\W获得5000经验")
	player:GetItems():AddItem(61276)
	player:GetItems():AddItem(61277)
	player:GetItems():AddItem(61278)
	player:GetItems():AddItem(61279)
	player:GetItems():AddItem(60135,10)
    player:GetItems():AddItem(80088,10)
    player:GetItems():AddItem(60232,10)
    player:GetItems():AddItem(60122,10)
    player:GetItems():AddItem(30002,30)
    player:GetItems():AddItem(50004)
    player:GetItems():AddItem(50005)
    player:ChangeExp(5000)
end

function Item61047:CanUse(user, target)
end

function Item61047:BattleUse(user, target)

end

AddItemTable(Item61047)