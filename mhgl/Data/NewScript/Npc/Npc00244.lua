Preload("Quest10043.lua")
Preload("Quest10044.lua")
Preload("Quest10046.lua")
Preload("Quest10047.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00244 = {							-- 孙小红
	npc_id = 244,						-- NPC ID
	name = GetNpcName(244),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00244:Talk(bProcess)
  local quest_ids = {10043,10046}
  if HasQuest(quest_ids) then
    NpcAsk("这女妖甚是厉害啊,出手不到两招,就打伤了法明长老,此妖定不是来之凡间~")
    SetAnswer(1,"帮忙调查")
    SetAnswer(2,"这么厉害,我还是快跑吧")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10043) then
        if Quest10043:Return() then
          Quest10044:Take()
        end
      elseif HasQuest(10046) then
        if Quest10046:Return() then
          Quest10047:Take()
        end
      end
    end
  else
    local pk = player:GetPK_Value()
    NpcAsk(string.format("你可以捐钱加人气的，你要加多少人气呢？\r施主当前的杀戳值为  #P%s点",pk))
    SetAnswer(1,"1点人气，花费1000000钱")
    SetAnswer(2,"10点人气，花费10000000钱")	
    SetAnswer(12,"不捐，我人气够呢")
    WaitAnswer(12)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      local pk = player:GetPK_Value()
      if player:GetMoney() < 1000000 then
        NpcSay("阿弥陀佛,施主身上的钱不够啊~")
        return
      end
      if pk == 0 then
        NpcSay("施主已经没有杀戳了,不用在进行捐钱了~")
        return
      end
      player:SetPK_Value(pk-1)
      player:ChangeMoney(-1000000)--]]
      NpcSay(string.format("阿弥陀佛,善哉善哉,施主乐善好施,杀戳值已经为%s点",pk-1))
    end
    if GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      local pk = player:GetPK_Value()
      if player:GetMoney() < 10000000 then
        NpcSay("阿弥陀佛,施主身上的钱不够啊~")
        return
      end
      if pk == 0 then
        NpcSay("施主已经没有杀戳了,不用在进行捐钱了~")
        return
      end
      player:SetPK_Value(pk-10)
      player:ChangeMoney(-10000000)--]]
      NpcSay(string.format("阿弥陀佛,善哉善哉,施主乐善好施,杀戳值已经为%s点",pk-10))
    end	
  end
end
      
      
    
    
    
    
    
    
    
    
    











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00244)
