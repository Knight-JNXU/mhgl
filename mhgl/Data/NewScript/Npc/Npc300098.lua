Preload("Quest10408.lua")
Npc300084 = {							-- 丁喜
npc_id = 300084,						-- NPC ID
name = GetNpcName(300084),				-- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300084:Talk(bProcess)
  --player:RemoveTitle(61)
  --player:AddTitle(61)
  local flag = player:GetQuests():GetFlag(300098)
  local flagBT = player:GetQuests():GetFlag(58585)
  local flagPK = player:GetQuests():GetFlag(48484)
  local PKValue = player:GetPK_Value()
  NpcAsk(string.format("“知错能改,善莫大焉”但你扰乱之罪,还需受到应当的处罚,希望能吸取教训,下次注意不要再犯了,你是否同意接受处罚？\r\#Y如果是因杀人放火进来的，可以等待杀孽值为0时，方可放你出去！\#G当前杀孽值：%d",PKValue))
  SetAnswer(6,"付费降低杀孽值")
  SetAnswer(1,"我知道错了，请给我处罚")
  SetAnswer(2,"如何处罚？")
  SetAnswer(3,"查看满意度")
  SetAnswer(4,"放我出去吧")
  SetAnswer(5,"滚犊子")
  WaitAnswer(5)
  if GetAnswer() == 2 then
    NpcSay("在这里监督这些作奸犯科的人也很久了,肚子也非常饿,你在附近给我找一些食物让我填下肚子便可,若是表现的好,我就可以放你出去~！")
  elseif GetAnswer() == 1 then
    if flag >= 250 then
      NpcSay("还想继续在这里待着呢？在待着这里都要发霉了~！")
      return
    end
    if  player:GetQuests():HasQuest(10408) then
      Quest10408:Return()
    else
      Quest10408:Take()
    end
  elseif GetAnswer() == 3 then
    ShowHint(string.format("\#W还要加把劲#090,满意度%d/250",flag))
  elseif GetAnswer() == 4 then
    player:JumpMap(34,314,314)
    ShowHint("不错,以后可别再进来了,下次可就不会这么简单了#56")
    script:Rumor(string.format("%s #W在#O苦行虚空#W中表现还挺满意,深刻认识到自己的错误,#Y狴奸#W甚是满意,希望他出去以后好好做人~！", player:GetCharNameLink()), false)
  elseif GetAnswer() == 6 then
    --script:SetSaying(true)
    NpcAsk(string.format("\#Y每点杀孽值需要花费1万银两！\r\#G当前杀孽值：%d",PKValue))
    SetAnswer(1,"降低100点")
    SetAnswer(2,"降低1000点")
    SetAnswer(3,"降低10000点")
    SetAnswer(4,"太贵了我还是坐等吧")
    WaitAnswer(4)
    if GetAnswer() == 1 and bProcess then
	script:SetSaying(true)
       local value = 100
	   if player:GetMoney() < value * 1000000 then
       NpcSay("你的钱不够喔！")
       return
       end
	   if PKValue <= value then
       local money = PKValue * 1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(0)
	   NpcSay("你的杀孽值成功降低为0，可以出去了！")
       else
       local money = value*1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(PKValue - value)
	   NpcSay(string.format("你的杀孽值成功降低了：%i",value))
       end
    elseif GetAnswer() == 2 and bProcess then
	script:SetSaying(true)
       local value = 1000
	   if player:GetMoney() < value * 1000000 then
       NpcSay("你的钱不够喔！")
       return
       end
	   if PKValue <= value then
       local money = PKValue * 1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(0)
	   NpcSay("你的杀孽值成功降低为0，可以出去了！")
       else
       local money = value*1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(PKValue - value)
	   NpcSay(string.format("你的杀孽值成功降低了：%i",value))
       end
    elseif GetAnswer() == 3 and bProcess then
	script:SetSaying(true)
       local value = 10000
	   if player:GetMoney() < value * 1000000 then
       NpcSay("你的钱不够喔！")
       return
       end
	   if PKValue <= value then
       local money = PKValue * 1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(0)
	   NpcSay("你的杀孽值成功降低为0，可以出去了！")
       else
       local money = value*1000000
       player:ChangeMoney(-money)	
       player:SetPK_Value(PKValue - value)
	   NpcSay(string.format("你的杀孽值成功降低了：%i",value))
       end
    end
end
end


      

AddNpcTable(Npc300084)
