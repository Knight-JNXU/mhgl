--author: apollo
--十步一杀：提高遇敌率速度，十步以内必然遇敌

Item60316 = {
}

function Item60316:MapUse(target)
	if target and target:GetUserType() == 2 then --同伴	
		if target:GetLock() then 
			ShowHint("已上锁的同伴无法使用")
			return
		end	
	  local mobid = target:GetMob_id()	
		ItemAsk(string.format("你确定要让\#P%s\#W使用超级豆斋果吗？【神兽使用不会消失】", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then	
		  if mobid == 359 or mobid == 360 or mobid == 361 or mobid == 363 or mobid == 364 or mobid == 365 or mobid == 366 or mobid == 367 or mobid == 368 or mobid == 369 or mobid == 370 or mobid == 371 or mobid == 372 then
		    if target:GetHealth() > 10000 then		
		      ShowHint("你的召唤兽已经很长寿了，无须再服用超级豆斋果")
		      return
		    end
		    target:ChangeHealth(500)
		    ShowHint("该同伴寿命提高500点,由于对神兽使用,本道具不会消失。")
		  else
		    if target:GetHealth() > 10000 then		
		      ShowHint("你的召唤兽已经很长寿了，无须再服用超级豆斋果")
		      return
		    end
		    if not item:ReduceCount() then return end -----减少数量
		    target:ChangeHealth(500)
		    ShowHint("该同伴寿命提高500点")
		  end
    end
  end
end











function Item60316:CanUse(user, target)
end

function Item60316:BattleUse(user, target)

end

AddItemTable(Item60316)









