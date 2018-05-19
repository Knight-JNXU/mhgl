Preload("Quest22103.lua")
Preload("Quest22104.lua")
Preload("Quest30300.lua")
Npc00003 = {							-- 孙小红
	npc_id = 3,						-- NPC ID
	name = GetNpcName(3),				-- NPC 名称
	quests = {Quest30300,Quest22103,Quest22104}									-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
ScriptRunNum = 0
function Npc00003:Talk(bProcess)
	--[[	if IsProcess() then
	     	script:OpenInterface("mixshop", 5)
		end
end--]]

	local quest30300 = player:GetQuests():GetQuest(30300) 
	if (player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id) or 
		HasQuest(22103) or HasQuest(22104) then
		NpcAsk( { "咳……咳咳，客官可是来听我老头子说书的？",
			} )		
		if player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(1, "师傅好客")
		end
		if HasQuest(22103) or HasQuest(22104) then
			SetAnswer(2,"阵法的迷惑")
		end
		SetAnswer(3,"召唤兽炼妖合成")
		SetAnswer(4, "离开")
		WaitAnswer(4)
		if GetAnswer() == 1 then
			NpcSay("我知道了，你先去回禀你师傅吧，我随后就到。")
			quest30300:FindTargetNPC(1)
			quest30300:SetDescription("事情办完了，回复师傅去吧。")
			quest30300:UpdateData()
		elseif GetAnswer() == 2 then
			if HasQuest(22103) then
				if Quest22103:Return()	then	
					Quest22104:Take()
				end
			elseif HasQuest(22104) then
				Quest22104:Return()
			end
		elseif GetAnswer() == 3 then
		    SynComMob(bProcess)
		end
	else
		NpcAsk({"周猎户最喜欢和我拉家常了,他就住在药店边上.\r","嘘一一千万不要告诉他们我爱吹牛啊,这会影响我的形象的!\r","人生最痛快的事莫过于和周猎户一起喝点小酒了!\r","天上有只牛在飞,一定是我在地上吹.\r"})	
	  SetAnswer(1,"召唤兽炼妖合成")
	  SetAnswer(2,"离开")
	  WaitAnswer(2)
	  if GetAnswer() == 1 then
	     SynComMob(bProcess)
	  end
	end
end

function SynComMob(bProcess)
   if ScriptRunNum == 1 then return end
   local SynType = 0
   NpcAsk("#A哟！少侠好眼力！还能知道我会这种手艺？果然是来者不善呐！哈哈哈...唉！别生气，开个玩笑嘛，既然你知道这世间有此奇术，想必你也是同道中人。那我就不跟你废话了，这世间还就只有我吹牛王能有此本领，既然少侠找到我，我也不太好意思多问你要价。每次让我施术需要收取：\#R1万银两\r\#A怎么样啊？少侠要不要试试看？我上有老下有小的，给个吃饭钱吧！")
   --if player:GetChar_id() == 1 then
   SetAnswer(1,"来来来，让杂家试试手气")
   --end
   SetAnswer(2,"离开")
   WaitAnswer(2)
   if GetAnswer() == 1 then
      NpcAsk("#A少侠豪爽，我就爱跟你们豪爽的人打交道。我这里有点增值服务项目，还请少侠过目。\r\#O增值服务项目：\r1.提升出现主宠的概率10% 价格：200w银两\r2.第一条+提升多技能合成概率 10% 价格：600w\r3.第一条+第二条+提升特殊技能合成成功率 5% 价格：1000w\r提醒：最终合成的BB资质、成长会随机混合两个BB的资质成长，等级跟随最终出现的BB，修为取最高的BB随机生成。\r\#P当然，你每次还得付给我10万劳务费。")
	  SetAnswer(1,"普通合成")
	  SetAnswer(2,"使用增值套餐①合成")
	  SetAnswer(3,"使用增值套餐②合成")
	  SetAnswer(4,"使用增值套餐③合成")
	  SetAnswer(5,"算了吧，你是非洲来的吧")
      WaitAnswer(5)
	  local MixMoney = 0
	  if GetAnswer() == 1 then
	     SynType = 1
		 MixMoney = 100000
	  elseif GetAnswer() == 2 then
	     SynType = 2
		 MixMoney = 2100000
	  elseif GetAnswer() == 3 then
	     SynType = 3
		 MixMoney = 6100000
	  elseif GetAnswer() == 4 then
	     SynType = 4
		 MixMoney = 10100000
	  elseif GetAnswer() == 5 then
	     return
	  end
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
	   NpcAsk("少侠请选择您要炼妖合成的#O“主宠”#P，可别选错咯！")
       for idx, var in ipairs(PnameTab) do
	     SetAnswer(idx,string.format("宠物栏位%d >> %s",idx, var))
       end
	   SetAnswer(99,"我再考虑考虑")
	   WaitAnswer(99)
	   local MainPartnerIdx = 0 --主宠索引
	   for i = 1, 9 do
	      if GetAnswer() == i then
		     MainPartnerIdx = i
			 break
		  end
	   end
	   if MainPartnerIdx == 0 then return end
	   NpcAsk("少侠请选择您要炼妖合成的#O“副宠”#P，可别选错咯！")
       for idx, var in ipairs(PnameTab) do
	     if idx ~= MainPartnerIdx then
	        SetAnswer(idx,string.format("宠物栏位%d >> %s",idx, var))
		 end
       end
	   SetAnswer(99,"我再考虑考虑")
	   WaitAnswer(99)
	   local SubPartnerIdx = 0 --副宠索引
	   for i = 1, 9 do
	      if GetAnswer() == i then
		     SubPartnerIdx = i
			 break
		  end
	   end
	   if SubPartnerIdx == 0 then return end
	   --合成确认
	   local Mpartner = player:GetPartners():GetPartnerByIndex(MainPartnerIdx-1)
	   local Spartner = player:GetPartners():GetPartnerByIndex(SubPartnerIdx-1)
	   local MainPartnerName = Mpartner:GetName() --待合成主宠名字
	   local SubPartnerName = Spartner:GetName() --待合成副宠名字
	   NpcAsk(string.format("#A少侠请最后确认要合成的两个召唤兽！\r#O请确认：\r\#E主宠所在栏位[%d] >> %s\r副宠所在栏位[%d] >> %s\r#P确认开始炼妖吗？",MainPartnerIdx,MainPartnerName,SubPartnerIdx,SubPartnerName))
	   SetAnswer(1,"我已确认，请开始")
	   SetAnswer(2,"我选错了")
	   WaitAnswer(2)
	   if GetAnswer() == 2 then
	      return
	   end
	   if GetAnswer() == 1 then
	      --开始合成
		  if player:GetMoney() < MixMoney then
             NpcSay(string.format("#A少侠！您选的套餐需要[#Y%d]#A的银两！我这里可不是福利院呢。",MixMoney))
             return
          end
	      local GetMainPartnerRand = 70 --主宠出现概率
		  local MoreSkillNum = 0 --多技能概率提升
		  local SpeSkillNum = 0 --特殊技能概率提升
		  local NSkillTab = {} -- 被动技能表
		  local SSkillTab = {} -- 主动技能表
		  local NewSkillTab = {} -- 新技能表
		  local MaxSkillNum = 0 --最终合成技能数量
		  local TotalSkillNum = 0 --总被动技能数量
		  if SynType == 2 then
		     GetMainPartnerRand = GetMainPartnerRand + 10
		  elseif SynType == 3 then
		     GetMainPartnerRand = GetMainPartnerRand + 10
			 MoreSkillNum = MoreSkillNum + 10
		  elseif SynType == 3 then
		     GetMainPartnerRand = GetMainPartnerRand + 10
			 MoreSkillNum = MoreSkillNum + 10
			 SpeSkillNum = SpeSkillNum + 5
		  end
		  --取出两个BB的所有技能
		  for i = 248, 336 do
		     if Mpartner:HasSkill(i) then
			    table.insert(NSkillTab,1,i)
		     end
		  end
		  for i = 4400, 4599 do
		     if Mpartner:HasSkill(i) then
			    table.insert(SSkillTab,1,i)
			 end
		  end
		  for i = 208, 536 do
		     if Spartner:HasSkill(i) then
			    table.insert(NSkillTab,1,i)
		     end
		  end
		  for i = 4400, 4599 do
		     if Spartner:HasSkill(i) then
			    table.insert(SSkillTab,1,i)
			 end
		  end
		  --技能表去重
		  local NSkillTabs = {} -- 被动技能表 已去重
		  local SSkillTabs = {} -- 主动技能表 已去重
		  local Finds = 0
		  for idx, var in ipairs(NSkillTab) do --去重被动
		     Finds = 0
		     for idx2, var2 in ipairs(NSkillTabs) do
			    if var == var2 then
				   Finds = 1
				   break
				end
			 end
			 if Finds == 0 then
			    table.insert(NSkillTabs,1,var)
			 end
          end
		  for idx, var in ipairs(SSkillTab) do --去重主动
		     Finds = 0
		     for idx2, var2 in ipairs(SSkillTabs) do
			    if var == var2 then
				   Finds = 1
				   break
				end
			 end
			 if Finds == 0 then
			    table.insert(SSkillTabs,1,var)
			 end
          end
		  --生成新技能表
		  TotalSkillNum = #NSkillTabs
		  MaxSkillNum = #NSkillTabs
		  if MaxSkillNum == 0 then 
		     NpcSay("#A你这两个都宝宝没技能啊？这让我怎么施法呢？别玩我啊大侠！施法一次很累的！") 
			 return 
		  end
		  player:ChangeMoney(-MixMoney)
		  if MaxSkillNum > 10 then
		     MaxSkillNum = 10
		  end
		  local Random = math.random(1,110)
		  Random = Random - MoreSkillNum
		  if Random < 1 then
		     Random = 1
		  end
		  MaxSkillNum = GetMaxSkillNum(MaxSkillNum,Random)
		  -- ShowError(MaxSkillNum)
		  -- ShowError(RandTable(NSkillTabs)) 可以用系统函数RandTable
		  local DelCount = TotalSkillNum - MaxSkillNum
		  local Index = 0
		  local x = 0
		  local Remove = 0
		  local Error = 0
		  while x < DelCount do
		     Error = Error + 1
		     Index = math.random(1,#NSkillTabs)
			 Remove = 0
		     for idx, var in ipairs(NSkillTabs) do
			    if idx == Index then
				   table.remove(NSkillTabs,Index)
				   Remove = 1
				   break
				end
			 end
			 if Remove == 1 then
			    x = x + 1
			 end
			 if #NSkillTabs == MaxSkillNum then
			    break
			 end
			 if Error > 2000 then
			    break
			 end
		  end
		  
		  --混合资质
		  local HPn = 800
		  local SPn = 800
		  local ATKn = 800
		  local DEFn = 800
		  local SPDn = 800
		  local POWn = 800
		  local HITn = 800
		  local EVAn = 800
		  local Grown = 0.998 --成长
		  local ChangeGrown = 0.998 --调整成长
		  local Culn = 0 --修为
		  local Pran = 0 --历练
		  
		  Random = math.random(1,10)
		  
		  HPn = Mpartner:GetHP_native()
		  if Random < 3 then HPn = Spartner:GetHP_native() end
		  Random = math.random(1,10)
		  
		  SPn = Mpartner:GetSP_native()
		  if Random > 4 then SPn = Spartner:GetSP_native() end
		  Random = math.random(1,10)
		  
		  ATKn = Mpartner:GetATK_native()
		  if Random < 4 then ATKn = Spartner:GetATK_native() end
		  Random = math.random(1,10)
		  
		  DEFn = Mpartner:GetDEF_native()
		  if Random > 5 then DEFn = Spartner:GetDEF_native() end
		  Random = math.random(1,10)
		  
		  SPDn = Mpartner:GetSPD_native()
		  if Random < 5 then SPDn = Spartner:GetSPD_native() end
		  Random = math.random(1,10)
		  
		  POWn = Mpartner:GetPOW_native()
		  if Random > 6 then POWn = Spartner:GetPOW_native() end
		  Random = math.random(1,10)
		  
		  HITn = Mpartner:GetHIT_native()
		  if Random < 6 then HITn = Spartner:GetHIT_native() end
		  Random = math.random(1,10)
		  
		  EVAn = Mpartner:GetEVA_native()
		  if Random > 7 then EVAn = Spartner:GetEVA_native() end
		  Random = math.random(1,10)
		  
		  Grown = Mpartner:GetGrow()
		  if Random < 5 then Grown = Spartner:GetGrow() end
		  --生成修为
		  local MainCuln = 0
		  local SubCuln = 0
		  MainCuln = Mpartner:GetCultivation()
		  SubCuln = Spartner:GetCultivation()
		  if MainCuln > 0 or SubCuln > 0 then
		     if MainCuln > SubCuln then
		        Culn = math.random(1,MainCuln)
		     elseif MainCuln < SubCuln then
			    Culn = math.random(1,SubCuln)
		     elseif MainCuln == SubCuln then
			    Culn = math.random(1,MainCuln)
		     end
		  end
		  --生成历练
		  local MainPran = 0
		  local SubPran = 0
		  MainPran = Mpartner:GetPractice()
		  SubPran = Spartner:GetPractice()
		  if MainPran > 0 or SubPran > 0 then
		     if MainPran > SubPran then
		        Pran = math.random(0,MainPran)
		     elseif MainPran < SubPran then
			    Pran = math.random(0,SubPran)
		     elseif MainPran == SubPran then
			    Pran = math.random(0,MainPran)
		     end
		  end
		  --取最终删除哪个BB
		  Random = math.random(1,100)
		  local OverPartner --最终留下的BB
		  local DelPartner --最终删除的BB
		  if Random < GetMainPartnerRand then
		     OverPartner = Mpartner
			 DelPartner = Spartner
		  else
		     OverPartner = Spartner
			 DelPartner = Mpartner
		  end
		  -- 取出最终BB当前属性
		  local nHPn = OverPartner:GetHP_native()
		  local nSPn = OverPartner:GetSP_native()
		  local nATKn = OverPartner:GetATK_native()
		  local nDEFn = OverPartner:GetDEF_native()
		  local nSPDn = OverPartner:GetSPD_native()
		  local nPOWn = OverPartner:GetPOW_native()
		  local nHITn = OverPartner:GetHIT_native()
		  local nEVAn = OverPartner:GetEVA_native()
		  local nGrown = OverPartner:GetGrow() --成长
		  local nCuln = OverPartner:GetCultivation() --修为
		  local nPran = OverPartner:GetPractice() --历练
		  -- 计算所需加减的值
		  HPn = HPn - nHPn
	      SPn = SPn - nSPn
		  ATKn = ATKn - nATKn
		  DEFn = DEFn - nDEFn
		  SPDn = SPDn - nSPDn
		  POWn = POWn - nPOWn
		  HITn = HITn - nHITn
		  EVAn = EVAn - nEVAn
		  ChangeGrown = Grown - nGrown
		  Culn = Culn - nCuln
		  Pran = Pran - nPran
		  -- 设定BB属性
		  local RandGrown = math.random(0,50) / 1000
		  local RandDownGrown = math.random(1,100)
		  local Find = 0
		  local mobid = OverPartner:GetMob_id()
		  local MaxGrown = 0
		  for i = 430, 434 do -- 检测是否RMB 宝宝
	         if mobid == i then
	            Find = 1
	            break
             end
          end
		  if Find == 0 then
			for i = 564, 566 do -- 检测是否限量版 宝宝
	            if mobid == i then
	               Find = 1
	               break
                end
            end
			if Find == 0 then
			  for i = 597, 599 do -- 检测是否限量版 宝宝
	            if mobid == i then
	               Find = 1
	               break
                end
              end
			end
		  end
		  if Find == 0 then
			for i = 359, 372 do -- 检测是否神兽 宝宝
	            if mobid == i then
	               Find = 1
	               break
                end
            end
		  end
		  if Find == 0 and mobid == 588 then Find = 1 end
		  if Find == 0 and mobid == 800 then Find = 1 end
		  if Find == 0 and mobid == 601 then Find = 1 end
		  if Find == 1 then
		     MaxGrown = 1.35
		  else
		     MaxGrown = 1.299
		  end
		  if Grown > MaxGrown then --限制成长
		     RandGrown = -1 * RandGrown
		  else
		     if RandDownGrown < 55 then
		        RandGrown = -1 * RandGrown
		     end
		  end
		  
		  OverPartner:ChangeHP_native(HPn)
		  OverPartner:ChangeSP_native(SPn)
		  OverPartner:ChangeATK_native(ATKn)
		  OverPartner:ChangeDEF_native(DEFn)
		  OverPartner:ChangeSPD_native(SPDn)
		  OverPartner:ChangePOW_native(POWn)
		  OverPartner:ChangeHIT_native(HITn)
		  OverPartner:ChangeEVA_native(EVAn)
		  OverPartner:ChangeGrow(ChangeGrown + RandGrown)
		  OverPartner:ChangeCultivation(Culn)
		  OverPartner:ChangePractice(Pran)
		  -- 删除原有技能
		  for i = 208, 536 do
		     if OverPartner:HasSkill(i) then
			    OverPartner:RemoveSkill(i)
			 end
		  end
		  for i = 4400, 4599 do
		     if OverPartner:HasSkill(i) then
		   	    OverPartner:RemoveSkill(i)
			 end
		  end
		  player:GetPartners():RemovePartner(DelPartner) --删除BB
		  NpcAsk("#O吹牛王正在施展炼妖秘术....\r.\r.\#P注意：请在5秒内点击下方选项，否则后果自负！\r.\r.")
	      SetAnswer(1,"快点快点，我都迫不及待了，亚麻跌！")
	      WaitAnswer(1)
		  if GetAnswer() == 1 then
		     -- 添加BB技能
		  for idx, var in ipairs(NSkillTabs) do
		      OverPartner:AddSkill(var)
          end
		  if #SSkillTabs > 0 then --添加主动技能
		     local SpeSkill = RandTable(SSkillTabs) --取随机主动技能
		     Random = math.random(1,100)
		     Random = Random - SpeSkillNum
			 if Random < 1 then
			    Random = 1
			 end
		     if Random <= 15 then
		        OverPartner:AddSkill(SpeSkill)
		     end
		  end
		  ScriptRunNum = 1
		  NpcSay("#A恭喜少侠！炼妖完成了，快看看结果如何！#O无论好坏都别打我...这种术法失传已久，我掌握的还不是很熟练。")
		  end
		  
	   end
   end
end
function GetMaxSkillNum(MaxSkillNum,Random)
          if MaxSkillNum == 10 then
		     if Random < 5 then
		     elseif Random < 10 then
			 MaxSkillNum = 9
		     elseif Random < 20 then
			 MaxSkillNum = 8
		     elseif Random < 30 then
			 MaxSkillNum = 7
		     elseif Random < 40 then
			 MaxSkillNum = 6
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,5)
		     end
		  elseif MaxSkillNum == 9 then
		     if Random < 5 then
		     elseif Random < 10 then
			 MaxSkillNum = 8
		     elseif Random < 20 then
			 MaxSkillNum = 7
		     elseif Random < 30 then
			 MaxSkillNum = 6
		     elseif Random < 40 then
			 MaxSkillNum = 5
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,4)
		     end
		  elseif MaxSkillNum == 8 then
		     if Random < 5 then
		     elseif Random < 10 then
			 MaxSkillNum = 7
		     elseif Random < 20 then
			 MaxSkillNum = 6
		     elseif Random < 30 then
			 MaxSkillNum = 5
		     elseif Random < 40 then
			 MaxSkillNum = 4
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,3)
		     end
		  elseif MaxSkillNum == 7 then
		     if Random < 5 then
		     elseif Random < 20 then
			 MaxSkillNum = 6
		     elseif Random < 30 then
			 MaxSkillNum = 5
		     elseif Random < 40 then
			 MaxSkillNum = 4
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,3)
		     end
		  elseif MaxSkillNum == 6 then
		     if Random < 5 then
		     elseif Random < 20 then
			 MaxSkillNum = 5
		     elseif Random < 40 then
			 MaxSkillNum = 4
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,3)
		     end
		  elseif MaxSkillNum <= 5 then
		     if Random < 50 then
		     elseif Random <= 110 then
			 MaxSkillNum = math.random(1,MaxSkillNum)
		     end
		  end
		  return MaxSkillNum
end


--[[  NpcAsk("欢迎使用GM测试打造系统,预祝你测试顺利~")
  SetAnswer(1,"我要打造武器")
  SetAnswer(2,"我要打造装备")
  SetAnswer(3,"等等")
  WaitAnswer(3)
  if GetAnswer() == 1 then
    NpcAsk("请问需要打造多少级的武器?")
    SetAnswer(1,"0级-80级武器")
    SetAnswer(2,"90级-110级武器")
    SetAnswer(3,"120级-140级武器")
    SetAnswer(4,"离开")
    WaitAnswer(4)
    if GetAnswer() == 1 and bProcess then  
      script:SetSaying(true)
	    script:OpenInterface("mixshop", 7)
	  elseif GetAnswer() == 2 and bProcess then  
      script:SetSaying(true)
	    script:OpenInterface("mixshop", 8)
	  elseif GetAnswer() == 3 and bProcess then  
      script:SetSaying(true)
	    script:OpenInterface("mixshop", 9)
	  end
	elseif GetAnswer() == 2 then
	  NpcAsk("请问需要打造什么")
	  SetAnswer(1,"防具")
	  SetAnswer(2,"饰品")
	  SetAnswer(3,"离开")
	  WaitAnswer(3)
    if GetAnswer() == 1 and bProcess then  
      script:SetSaying(true)
	    script:OpenInterface("mixshop", 12)
	  elseif GetAnswer() == 2 and bProcess then  
      script:SetSaying(true)
	    script:OpenInterface("mixshop", 14)
	  end
	end
end--]]










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00003)
