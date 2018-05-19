Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest26005.lua")
Preload("Quest26006.lua")
Preload("Quest26007.lua")
Preload("Quest26008.lua")




Npc00555= {	                  --陆萧然
	npc_id = 555,				
	name = GetNpcName(555), 		
	}



Npc00555.Talk = function(self, bProcess)
  NpcAsk("你想......？")
  SetAnswer(1,"我想领取任务链任务（花费58000两银子）")
  SetAnswer(2,"我想使用善恶点替代任务链所需装备")
  SetAnswer(3,"我想查询我的善恶点")
  SetAnswer(4,"我想取消任务链任务")
  SetAnswer(5,"我只是看看")
  WaitAnswer(5)
  if GetAnswer() == 4 then
    if HasQuest(26001) or HasQuest(26002) then
	Quest26001:Init()
	player:GetQuests():RemoveQuest(26001)
    player:GetQuests():RemoveQuest(26002)
	NpcSay("任务链已全部取消，环数清零！")
	else
	NpcSay("你还没有领取任务啊！")
	end
  elseif GetAnswer() == 1 then
    if player:GetMoney() < 58000 then
      NpcSay("当前银两不能领取任务链")
      return
    end
    if bProcess then
      script:SetSaying(true)
      if not HasQuest(26001) and not HasQuest(26002)and not HasQuest(26003)and not HasQuest(26004) and not HasQuest(26005) and not HasQuest(26006)and not HasQuest(26007)and not HasQuest(26008) then
        if player:GetLevel() < 60 then
          NpcSay("此任务是比较危险的,还是等级60级以后再来领取吧！")
          return
        end
        local Exp = math.floor(player:GetExp())--当前经验(取整)
        local result = player:GetNextLvExp()--当前等级升级经验()
        if Exp >= result then
          NpcSay("当前经验低于升级经验才能领取任务。")
          return
        end
        Quest26001:Take()
--[[        local i = math.random(2,2)
        if i == 1 then
          Quest26001:Take()
        elseif i == 2 then
          Quest26002:Take()
        elseif i == 3 then
          Quest26003:Take()
        else  
          Quest26004:Take()
        end--]]
        player:ChangeMoney(-58000)
      else
        NpcSay("先把手里的事做完再来吧。")
      end
    end
  end
end
        
          
        
        
        

        
        
        
          
        
          




  














AddNpcTable(Npc00555)

