
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00334 = {							-- 杵官王
	npc_id = 334,						-- NPC ID
	name = GetNpcName(334),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
RunScript = 0
function Npc00334:Talk(bProcess) 
  NpcAsk("我是天天元宝交易公证员，目前提供多种元宝数的交易公证服务，在这里可以寄售元宝，也能后买别人寄售的元宝。")
  SetAnswer(1,"购买")
  SetAnswer(2,"寄售元宝")
  SetAnswer(3,"前往官方在线购汇平台")
  SetAnswer(4,"什么是寄售点数、天天专用点数")
  SetAnswer(5,"月卡转换")
  SetAnswer(6,"月卡与超值年卡介绍")
  SetAnswer(7,"路过不小心点到，嘿嘿再见。")
  WaitAnswer(7)
  if GetAnswer() == 1 then 
    if bProcess then
      player:OpenSellYuanBao()
    end
  elseif GetAnswer() == 2 then
    if bProcess then
      player:OpenSellYuanBao()
    end
  elseif GetAnswer() == 3 then
    local file = io.open("./LuaDat/GoldConfig_sell.dat","r")
	local PayData = file:read()
	file:close()
    local Paylist = Split(PayData, ",")
	--local Nyuanbao = player:GetYuanBao()
	local RateInt = Paylist[2] * 100
	local id = player:GetChar_id()
	local MainMoeny = math.floor(Paylist[1]/Paylist[2]) --计算初始 1000元宝兑银两的比例
	local YbRate = 1 + (1 - Paylist[2]) --计算当前银两兑换元宝的汇率
	local YbRateInt = YbRate * 100
    local InMoney = math.floor(MainMoeny * YbRate) --通过汇率计算当前购入1000元宝所需银两
    NpcAsk(string.format("欢迎光临KJ在线购汇平台！\r\#R当前购入银两汇率：%s％\r\#R当前购入元宝汇率：%s％\r\#W当前平台元宝兑银两比例为：#P1000#W元宝=#P%s#W银两。\r\#W当前平台银两兑换元宝比例为：#P1000#W元宝=#P%s#W银两。\r汇率每2小时重置为100％，汇率浮动范围：124％~65％，2小时内购汇人数越多，汇率越低，否则相反！\r汇率每5分钟增长1％，购入元宝每次下降2％",RateInt,YbRateInt,Paylist[1],InMoney))
	--SetAnswer(1,"购入1000元宝的银两")
	SetAnswer(2,"购入1000元宝")
	SetAnswer(3,"再观望一下")
	WaitAnswer(3)
	if GetAnswer() == 1 then
	   if player:GetYuanBao() < 1000 then
	      NpcSay("#A抱歉，您的元宝不够喔！")
		  return
	   end
	   if RunScript == 1 then return end
	   --扣除元宝
	   file = io.open("./LuaDat/PayConfig.dat",'a')
	   file:write(string.format("%s %d\r\n",id,-1000))
	   file:close()
	   --读入汇率
	   file = io.open("./LuaDat/GoldConfig_sell.dat","r")
	   local nPayData = file:read()
	   file:close()
	   local nPaylist = Split(nPayData, ",")
	   --写出购买记录
	   file = io.open("./LuaDat/GoldConfig_buy.dat",'a')
	   file:write(string.format("%s %d\r\n",id,nPaylist[1]))
	   file:close()
	   --发放银两
	   player:ChangeMoney(nPaylist[1])
	   RunScript = 1
	   NpcSay(string.format("#R由于汇率时时变动，您刚才看到比例可能已改变！\r\#W.\r\#A本次成功购入银两：%d两",nPaylist[1]))
	elseif GetAnswer() == 2 then
	   file = io.open("./LuaDat/GoldConfig_sell.dat","r")
	   PayData = file:read()
	   file:close()
	   Paylist = Split(PayData, ",")
	   MainMoeny = math.floor(Paylist[1]/Paylist[2]) --计算初始 1000元宝兑银两的比例
	   YbRate = 1 + (1 - Paylist[2]) --计算当前银两兑换元宝的汇率
	   InMoney = math.floor(MainMoeny * YbRate) --通过汇率计算当前购入1000元宝所需银两
	   if player:GetMoney() < InMoney then
	      NpcSay("#A抱歉，您的银两不足#P%d，由于汇率时时变动，您刚才看到比例可能已改变！")
		  return
	   end
	   if RunScript == 1 then return end
	   player:ChangeMoney(-1 * InMoney)
	   --添加元宝
	   file = io.open("./LuaDat/PayConfig.dat",'a')
	   file:write(string.format("%s %d\r\n",id,1000))
	   file:close()
	   --写出购买记录
	   file = io.open("./LuaDat/GoldConfig_buy.dat",'a')
	   file:write(string.format("buyYB：%s %d\r\n",id,InMoney))
	   file:close()
	   RunScript = 1
	   NpcSay(string.format("#R由于汇率时时变动，您刚才看到比例可能已改变！\r\#W.\r\#A本次成功购入1000元宝，花费银两：%d两\r\#W.\r\#O请在商城内点击“刷新”按钮查看是否已到账！",InMoney))
	end
  end
end

function Split(szFullString, szSeparator)  
local nFindStartIndex = 1  
local nSplitIndex = 1  
local nSplitArray = {}  
while true do  
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
   if not nFindLastIndex then  
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
    break  
   end  
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
   nSplitIndex = nSplitIndex + 1  
end  
return nSplitArray  
end 










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00334)
