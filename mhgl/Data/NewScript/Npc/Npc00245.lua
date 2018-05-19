
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00245 = {							-- 杵官王
	npc_id = 245,						-- NPC ID
	name = GetNpcName(245),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
RunScript = 0
function Npc00245:Talk(bProcess) 
  NpcAsk("上天有好生之德，行善方能积德。!")
  SetAnswer(1,"我想放生")
  SetAnswer(2,"我只是看看")
  WaitAnswer(2)
  if GetAnswer() == 1 then
      local Pcount = player:GetPartners():GetCount() --取召唤兽数量
      local PnameTab = {}
      local Partner
      local PName
	   for i = 0, Pcount-1 do
	     Partner = player:GetPartners():GetPartnerByIndex(i)
	     PName = Partner:GetName() --取BB名字
	     if Partner ~= nil then
		    table.insert(PnameTab,i+1,PName)
	     end
       end
	  NpcAsk("#A请选择要放生的召唤兽！")
	  for idx, var in ipairs(PnameTab) do
	     SetAnswer(idx,string.format("宠物栏位%d >> %s",idx, var))
      end
	  SetAnswer(99,"我再考虑考虑")
	  WaitAnswer(99)
	  if GetAnswer() == 99 then return end
	  local PartnerIdx = 0 --宠索引
	  for i = 1, 9 do
	      if GetAnswer() == i then
		     PartnerIdx = i
			 break
		  end
	  end
	  if PartnerIdx == 0 then return end
	  if RunScript == 1 then return end
	  Partner = player:GetPartners():GetPartnerByIndex(PartnerIdx-1)
	  player:GetPartners():RemovePartner(Partner)
	  local Money = math.random(5000,12000)
	  local Gold = math.random(1,20) --元宝
	  local Rand = math.random(1,20)
	  local Honor = math.random(8,12)
	  local GoddNess = math.random(1,2)
	  local id = player:GetChar_id()
	  local item = 0
	  if Rand == 1 then
		local file = io.open("./LuaDat/PayConfig.dat",'a')
		file:write(string.format("%s %d\r\n",id,Gold))
		file:close()
		ShowError(string.format("\#W获得元宝#P%d#W点，商城刷新获得",Gold))
	  elseif Rand == 2 then
	    item = RandTable({400000,400001,400002,400003,400004,400005,400006,400007,400008,400009,400010,400011,400012,400013,400014,400015,400016,400017,400018,400019,400020,400021,400022,400023,400024,400025,400026,400027,400028,400029,400030,400031,400032,400033,400034,400035,400036,400037,400038,400039,400040,400041}) --变身卡
		player:GetItems():AddItem(item, 1)
		ShowError("\#W获得一张怪物卡片")
	  end
	  player:ChangeMoney(Money)
	  ShowError(string.format("\#W获得银两#P%d#W两",Money))
	  player:ChangeHonor(Honor)
	  ShowError(string.format("\#W心慈仁善，获得威望%d", Honor))
	  player:ChangeGoodness(GoddNess, 44)
	  ShowError(string.format("\#W心慈仁善，获得善恶%d", GoddNess))
	  RunScript = 1
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00245)
