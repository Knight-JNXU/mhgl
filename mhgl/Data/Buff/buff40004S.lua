--外挂检查脚本
--脚本由QQ:294441214提供，欢迎各位联系QQ定做脚本。情缘
function buff40004Repeat(buff, Char, finish)
  local lv = Char:GetLevel() / 5;
  local msgA = ("#Y泡点奖励：15000点经验，98银两")
  local msgB = ("#Y泡点奖励：15000点经验，988银两")
 if Char:GetVP() == Char:GetMaxVP() then
    Char:ChangeMoney(98)
	Char:ChangeExp(15000)
    Char:ShowAwardMsg(msgA)
   return
 end
 if Char:GetVP() + lv <= Char:GetMaxVP() then
    Char:ChangeVP(lv)
	Char:ChangeMoney(988)
	Char:ChangeExp(15000)
    Char:ShowAwardMsg(msgB)
  else
    local VpChange = Char:GetMaxVP() - Char:GetVP()
    Char:ChangeVP(VpChange)
	Char:ChangeMoney(988)
	Char:ChangeExp(15000)
	Char:ShowAwardMsg(msgB)
  end
end
    
  
