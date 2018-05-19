--author: apollo
--武学秘籍 指定同伴后右击使用：使同伴学会真·夜战招式

Item80081 = {
}

function Item80081:MapUse(target)
	if target and target:GetUserType() == 2 then --同伴
		if target:GetLock() then 
			ShowHint("已上锁的同伴无法使用")
			return
		end	
		IAsk(string.format("你确定对\#P%s\#W使用吸附石？\r#Y请注意:使用后召唤兽会消失\r召唤兽没有特定技能也会消失~！\r#O本次使用的吸附石附加技能为【惊心一剑】", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then		
		  if player:GetMoney() < 50000 then
		    ISay("需要银两5万,少侠银两不足")
		    return
		  end
		  if not item:ReduceCount() then return end	
			local NewSkillID = 4501
			local NewSkillName = "惊心一剑"
			local i = math.random(1,100)
			if target:HasSkill(NewSkillID) then
			  if i < 11 then 
			    ISay("吸附成功,获得惊心一剑魔兽要诀。")
			    player:GetPartners():RemovePartner(target)
			    player:GetItems():AddItem(40044,1)
			    player:ChangeMoney(-50000)
          script:Rumor(string.format("#23#24#23 %s #O使用吸附石,成功的将召唤兽身上的#P%s#O吸附了下来#97", player:GetCharNameLink(), NewSkillName), true)
			  else
			    ISay("吸附失败,你的召唤兽也离你远去")
			    player:GetPartners():RemovePartner(target)
			    player:ChangeMoney(-50000)
			  end
			else
			    ISay("吸附失败,你的召唤兽也离你远去")
			    player:GetPartners():RemovePartner(target)
			    player:ChangeMoney(-50000)
			end
	  end
	end
end



function Item80081:CanUse(user, target)
end

function Item80081:BattleUse(user, target)

end

AddItemTable(Item80081)