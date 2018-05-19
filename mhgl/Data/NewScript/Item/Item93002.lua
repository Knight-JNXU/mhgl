Item93002= {
}

ScriptRunNum = 0
function Item93002:MapUse(target)
	local file = io.open("./LuaDat/GoldConfig_sell.dat","r")
	local PayData = file:read()
	file:close()
    local Paylist = Split(PayData, ",")
	--local Nyuanbao = player:GetYuanBao()
	local RateInt = Paylist[2] * 100
	local id = player:GetChar_id()
    IAsk(string.format("欢迎光临官方在线购汇平台！\r\#R当前汇率：%s％\r\#W当前平台银票兑银两比例为：#P1张银票#W=#P%s#W银两。\r汇率每2小时重置为100％，汇率浮动范围：124％~65％，2小时内购汇人数越多，汇率越低，否则相反！\r汇率每5分钟增长1％，购入银两每次下降2％",RateInt,Paylist[1]))
    SetAnswer(1,"兑换银两")
	SetAnswer(2,"我再观望一下")
    WaitAnswer(2)
	if GetAnswer() == 1 then
	   if ScriptRunNum == 1 then return end
	   --读入汇率
	   file = io.open("./LuaDat/GoldConfig_sell.dat","r")
	   local nPayData = file:read()
	   file:close()
	   local nPaylist = Split(nPayData, ",")
	   --写出购买记录
	   file = io.open("./LuaDat/GoldConfig_buy.dat",'a')
	   file:write(string.format("buyMN：%s %d\r\n",id,nPaylist[1]))
	   file:close()
	   --发放银两
	   player:ChangeMoney(nPaylist[1])
	   ScriptRunNum = 1
	   ShowHint(string.format("#R由于汇率时时变动，您刚才看到比例可能已改变！\r\#W.\r\#A本次成功兑换银两：%d两",nPaylist[1]))
	   player:GetItems():RemoveItem(93002, 1)
	elseif GetAnswer() == 2 then
	
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


function Item93002:CanUse(user, target)
end

function Item93002:BattleUse(user, target)
end

AddItemTable(Item93002)