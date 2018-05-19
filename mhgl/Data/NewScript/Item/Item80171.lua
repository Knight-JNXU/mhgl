--author: hula
--金柳露指定同伴后右击使用：只能对携带要求不大于35级的紫人形同伴使用，等级归0，各项能力重新生成
--北方修改  2009-0-23
Item30000 = {
}

function Item30000:MapUse(target)
	local mobid = target:GetMob_id()	
	  
	local PartnerTable = { 
						[330] = 7063, --变异芙蓉
						[320] = 7067, --变异蝴蝶
						[336] = 7064, -- 变异鬼将
						[334] = 7041,  -- 变异吸血鬼
						[346] = 7080,  --变异律法
						[347] = 7077, --变异灵符
						[396] = 7068, --变异画魂
						[316] = 7085, --变异古代瑞兽						
						[399] = 7075,  --变异净瓶
						[359] = 7060,  --超级白泽
						[360] = 7078, --超级灵鹿
						[361] = 7061,    --超级大象
						[362] = 7106,  --超级大熊猫
						[363] = 7065, --超级海豚
						[351] = 7111,  --变异黑山老妖
						[343] = 7100,  --变异雾中仙
						[340] = 7108,   -- 变异夜罗刹
						[353] = 7089,  --变异如意
						[364] = 7093, --超级神牛
						[365] = 7070, --超级蟾蜍
						[366] = 7090,		--超级神虎		
						[367] = 7087, --超级人参果
						[368] = 7084,--超级泡泡
						[369] = 7095, --超级神兔				 
						[371] = 7069,  --超级大鹏
						[372] = 7079   --超级金丝猴										
						}
						
						
	if target and target:GetUserType() == 2 then --同伴	
		if target:GetLock() then 
			ShowHint("已上锁的同伴无法使用")
			return
		end	
		if target:GetRace() ~= 4 then
			ShowHint("金柳露只能对紫人形同伴使用")
			return
		end
		for i=0,1,-1 do
		  if mobid == i then
		    ShowHint("神兽不能使用#46")
		    return
		  end
		end
		ItemAsk(string.format("你确定要让\#P%s\#W使用吗？", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then		
			if target:GetReqLv() >= 175 then
			  ShowHint("只能对携带要求不大于175级的同伴使用")
			  return
			end
			if not item:ReduceCount() then return end
			local r = math.random(0, 100)
			if r <= 10 and mobid and target:GetRace()== 10 and PartnerTable[mobid] ~= nil then --百分之2的几率生成变异宝宝				
				player:GetPartners():RemovePartner(target)
				player:GetPartners():AddPartner(PartnerTable[mobid]) --变异宝宝ID
		    ShowHint("竟然进阶了！")	
		    script:Rumor(string.format(" %s #W对#O%s#W使用了妖魔内丹,竟然产生了进化#24", player:GetCharNameLink(),target:GetName()), true)
			else			
				--target:ResetPartner()			--!!!!!! 等级变为0级，各项能力重新生成
			  ShowHint("吐下妖魔内丹后你的还差一点点火候")		
	    end
	  end
	else
	  ShowHint("只能对同伴使用")
	end
end--]]

function Item30000:CanUse(user, target)
end

function Item30000:BattleUse(user, target)

end

AddItemTable(Item30000)