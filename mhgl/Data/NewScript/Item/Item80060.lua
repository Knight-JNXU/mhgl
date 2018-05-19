--author: apollo
--【功效】恢复愤怒值=品质*1，附加疯狂状态3~4回合
Item80060 = {
}

function Item80060:MapUse(target)
  if not item:ReduceCount() then return end
  ShowHint("获得#P400万#W银两#89")
  player:GetItems():AddItem(444444, 11)
   player:GetItems():AddItem(402851, 55)
    player:GetItems():AddItem(30001, 110)
	 player:GetItems():AddItem(63060, 55)
end

function Item80060:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item80060:BattleUse(user, target)
end

AddItemTable(Item80060)