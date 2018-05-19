--wangzl


Npc800006 = {							
	npc_id = 800006,				--战斗雪人明雷
	name = GetNpcName(800006),	
}


function Npc800006:Talk(bProcess)
  if bProcess then
	  script:SetSaying(true)
	  if player:GetLevel() >= 30 then 
	    ShowHint("少侠还需要雪球么#24还是把机会留给新人吧")
	    return
	  end
	  
	  
	  
    player:GetItems():AddItem(60129,1)
    ShowHint("\#W获得大雪球#18")
    if npc then
      npc:Destroy()
    end
  end
end



AddNpcTable(Npc800006)
