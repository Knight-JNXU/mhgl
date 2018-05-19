function CalPlayerNextLvExp(Lv)
--[[	local result = 0;
	if Lv >= 1 and Lv <= 10 then
		result = 0.03 * Lv - 0.02 ;
	elseif Lv >= 11 and Lv <= 20 then
		result = 0.166 * Lv - 1.38 ;
	elseif Lv >= 21 and Lv <= 30 then
		result = 0.084 * Lv + 0.26 ;
	elseif Lv >= 31 and Lv <= 40 then
		result = 0.404 * Lv - 9.34 
	elseif  Lv >= 41 and Lv <= 50 then
	    result = 0.736 * Lv - 22.62 
	elseif  Lv >= 51 and Lv <= 60 then
	    result = 0.516 * Lv - 11.62 ;	
	elseif  Lv >= 61 and Lv <= 70 then
	    result = 1.077 * Lv - 45.28 ;
	elseif  Lv >= 71 and Lv <= 80 then
	    result = 0.267 * Lv + 11.42 ; 
	elseif  Lv >= 81 and Lv <= 90 then
	    result = 0.738 * Lv - 26.26 ; 	
	elseif  Lv >= 91 and Lv <= 100 then
		result = 0.516 * Lv - 6.28 ; 	
	elseif  Lv >= 101 and Lv <= 110 then
		result = 0.487 * Lv - 3.38 ; 	
	elseif  Lv >= 111 and Lv <= 120 then
		result = 0.511 * Lv - 6.02 ; 	
	elseif  Lv >= 121 and Lv <= 130 then
		result = 0.491 * Lv - 3.62 ; 		
	end--]]
	local result = 0;
	if Lv >= 1 and Lv <= 10 then
		result = 0.03 * Lv - 0.02 ;
	elseif Lv >= 11 and Lv <= 20 then
		result = 0.166 * Lv - 1.38 ;
	elseif Lv >= 21 and Lv <= 30 then
		result = 0.084 * Lv + 0.26 ;
	elseif Lv >= 31 and Lv <= 40 then
		result = 0.404 * Lv - 9.34 
	elseif  Lv >= 41 and Lv <= 50 then
	    result = 0.736 * Lv - 22.62 
	elseif  Lv >= 51 and Lv <= 60 then
	    result = 0.516 * Lv - 11.62 ;	
	elseif  Lv >= 61 and Lv <= 70 then
	    result = 1.077 * Lv - 45.28 ;
	elseif  Lv >= 71 and Lv <= 80 then
	    result = 0.267 * Lv + 11.42 ; 
	elseif  Lv >= 81 and Lv <= 89 then
	    result = 0.738 * Lv - 26.26 ; 	
	elseif  Lv >= 90 and Lv <= 99 then
		result = 13.33 * Lv - 1159.54 ; 	
	elseif  Lv >= 100 and Lv <= 109 then
		result = 36 * Lv - 3403.84 ; 	 	
	elseif  Lv >= 110 and Lv <= 119 then
		result = 76 * Lv - 7763.84 ; 
	elseif  Lv >= 120 and Lv <= 128 then
		result = 6000 ; 		
	elseif  Lv >= 129 and Lv <= 130 then
		result = 12000 ; 		
	--elseif  Lv >= 140 and Lv <= 150 then
		--result = 127 * Lv - 15523.84 ; 		
	--elseif  Lv >= 150 and Lv <= 160 then
		--result = 128 * Lv - 14523.84 ; 		
	--elseif  Lv >= 160 and Lv <= 170 then
		--result = 128 * Lv - 15500.84 ; 		
	--elseif  Lv >= 170 and Lv <= 175 then
		--result = 128 * Lv - 15900.84 ; 		 		
	end
	result = result * 6.6 * 70 * (4 * 100 + 10) + 100 ;
	LuaUI.SetTempResult(result);
	return result;
end

function CalSkillNextLvExp(Lv, shopID)
	local result = 0 ;
	if shopID >= 1 and shopID <= 12 then
		LuaUI.SetTempResult(result);
	elseif shopID >=45 and shopID <= 47 then
	    LuaUI.SetTempResult(result);
	elseif shopID >= 18 and shopID <= 29 then
		LuaUI.SetTempResult(result);
	elseif shopID >= 30 and shopID <= 41 then
		LuaUI.SetTempResult(result);	
	end
end

function CalSkillNextLvMoney(Lv, shopID)
	local result = 0 ;
	if shopID >= 1 and shopID <= 12 then       
	    LuaUI.SetTempResult(result);
	elseif shopID >=45 and shopID <= 47 then
	    LuaUI.SetTempResult(result);
	elseif shopID >= 13 and shopID <= 17 then       
	    LuaUI.SetTempResult(2 * result);
	elseif  shopID >= 18 and shopID <= 29 then
	    LuaUI.SetTempResult(result);
	elseif  shopID >= 30 and shopID <= 41 then
	    LuaUI.SetTempResult(result);	
	end	
end

function CalSkillNextLvYuanBao(Lv, shopID)
	local result = CalPlayerNextLvExp(Lv) / 12 ;	
	LuaUI.SetTempResult(result);
end

function CalSkillNextLvHonor(Lv, shopID)
	local result = 1000000 ;
    if shopID >= 13 and shopID <= 14 then 
	    result = 10 * Lv ^ 2;
		LuaUI.SetTempResult(result);
	elseif shopID >= 15 and shopID <= 17 then
	    result = 2 * Lv ^ 2 * (1 + 0.01 * Lv);
		LuaUI.SetTempResult(result);
	end
end

function CalSkillNextLvDonateFaction(Lv, shopID)
	local result = CalPlayerNextLvExp(Lv) / 12 ;	
	LuaUI.SetTempResult(result);
end

function CalSkillNextLvDonateManor(Lv, shopID)
	local result = CalPlayerNextLvExp(Lv) / 12 ;	
	LuaUI.SetTempResult(result);
end

function CalPetNextLvExp(Lv)
	--local result = 5 * Lv * (Lv  + 1) + 90;
	local result = 40 * Lv + 80;
	LuaUI.SetTempResult(result);
end

function GetUnSoulBoundStoneID(rare)
	local result
	if rare == 0 or rare == 1 or rare == 2 then
		result = 80019
	elseif rare == 3 then
		result = 80019
	elseif rare == 4 or rare == 5 then
		result = 80019
	else
		result = 0
	end
	LuaUI.SetTempResult(result);
end

function GetUnSoulBoundStoneNum(lv)
	local result = 1 
	LuaUI.SetTempResult(1);
end

--[[
gem id:

	id				level		type		bound	name
	60011 ~ 60020	1 ~ 10		atk			N		玛瑙石
	60401 ~ 60410	1 ~ 10		atk			Y
	60711 ~ 60720	1 ~ 10		atk			N		无暇玛瑙石
	60801 ~ 60810	1 ~ 10		atk			Y

	60021 ~ 60030	1 ~ 10		def			N		紫水晶
	60411 ~ 60420	1 ~ 10		def			Y
	60721 ~ 60730	1 ~ 10		def			N		无暇紫水晶
	60811 ~ 60820	1 ~ 10		def			Y

	60031 ~ 60040	1 ~ 10		hit			N		黄晶玉
	60421 ~ 60430	1 ~ 10		hit			Y
	60731 ~ 60740	1 ~ 10		hit			N		无暇黄晶玉
	60821 ~ 60830	1 ~ 10		hit			Y

	60041 ~ 60050	1 ~ 10		eva			N		天青石
	60431 ~ 60440	1 ~ 10		eva			Y
	60741 ~ 60750	1 ~ 10		eva			N		无暇天青石
	60831 ~ 60840	1 ~ 10		eva			Y

	60051 ~ 60060	1 ~ 10		pow			N		蓝宝石
	60441 ~ 60450	1 ~ 10		pow			Y
	60751 ~ 60760	1 ~ 10		pow			N		无暇蓝宝石
	60841 ~ 60850	1 ~ 10		pow			Y

	60061 ~ 60070	1 ~ 10		spd			N		绿翡翠
	60451 ~ 60460	1 ~ 10		spd			Y
	60761 ~ 60770	1 ~ 10		spd			N		无暇绿翡翠
	60851 ~ 60860	1 ~ 10		spd			Y

	60071 ~ 60080	1 ~ 10		maxHp		N		红宝石
	60461 ~ 60470	1 ~ 10		maxHp		Y
	60771 ~ 60780	1 ~ 10		maxHp		N		无暇红宝石
	60861 ~ 60870	1 ~ 10		maxHp		Y

	60081 ~ 60090	1 ~ 10		maxSp		N		夜明珠
	60471 ~ 60480	1 ~ 10		maxSp		Y
	60781 ~ 60790	1 ~ 10		maxHp		N		无暇夜明珠
	60871 ~ 60880	1 ~ 10		maxHp		Y
	
	------------------------------------------
	60301 ~ 60310	1 ~ 10		镶嵌符
	------------------------------------------
	60311 ~ 60320	1 ~ 10		摘除符
	------------------------------------------
	60601 - 60610	1 ~ 10		抛光石
	60611 ~ 60620	1 ~ 10
	------------------------------------------
]]--

function GetGemItemLevel(GemItemId)
	local GemItemLevel = math.fmod(GemItemId, 10);
	if GemItemLevel == 0 then
		GemItemLevel = 10;
	end
	if GemItemLevel < 1 or GemItemLevel > 10 then
		GemItemLevel = 1;
	end
	LuaUI.SetTempResult(GemItemLevel);
	return GemItemLevel;
end

function GetSoulBoundGemItemId(GemItemId)
	if GemItemId >= 60011 and GemItemId <= 60090 then
		GemItemId = GemItemId;
	end
	
	if GemItemId >= 60711 and GemItemId <= 60790 then
		GemItemId = GemItemId ;
	end
	
	LuaUI.SetTempResult(GemItemId);
	return GemItemId;
end

function GetGemMixConsumeMoney(GemItemId)
	local GemItemLevel = GetGemItemLevel(GemItemId);
	local ConsumeMoney = 20000 * GemItemLevel;
	LuaUI.SetTempResult(ConsumeMoney);
	return ConsumeMoney;
end

function GetGemInlayConsumeMoney(EqItemLv)
	local ConsumeMoney = 200 * EqItemLv;
	LuaUI.SetTempResult(ConsumeMoney);
	return ConsumeMoney;
end

function GetGemRemoveConsumeMoney(EqItemLv)
	local ConsumeMoney = 200 * EqItemLv;
	LuaUI.SetTempResult(ConsumeMoney);
	return ConsumeMoney;
end

function CheckGemMixItemId(FirstItemId, NewItemId, ItemLock)

	if ItemLock == true then
		LuaUI.SetTempResult(1); -- 已上锁的宝石不可以进行合成
		return ;
	end
	
	-- max level gem can not mix
	local GemItemLevel = GetGemItemLevel(NewItemId);
	if GemItemLevel >= 5 then
		LuaUI.SetTempResult(2); -- 宝石已经是最大等级
		return ;
	end

	if FirstItemId == 0 or FirstItemId == NewItemId then
		LuaUI.SetTempResult(0); -- ok
		return ;
	end
	
	-- 60011 (unbound id) == 60401 (bound id), 60012 == 60402 ...
	if FirstItemId > NewItemId then
		if FirstItemId >= 60401 and FirstItemId <= 60480 and FirstItemId - 390 == NewItemId then
			LuaUI.SetTempResult(0); -- ok
			return ;
		elseif FirstItemId >= 60801 and FirstItemId <= 60880 and FirstItemId - 90 == NewItemId then
			LuaUI.SetTempResult(0); -- ok
			return ;
		else
			LuaUI.SetTempResult(3); -- 必须为同等级同类型的宝石才可以进行合成
			return ;
		end
	elseif FirstItemId < NewItemId then 
		if FirstItemId >= 60011 and FirstItemId <= 60090 and FirstItemId + 390 == NewItemId then
			LuaUI.SetTempResult(0); -- ok
			return ;
		elseif FirstItemId >= 60711 and FirstItemId <= 60790 and FirstItemId + 90 == NewItemId then
			LuaUI.SetTempResult(0); -- ok
			return ;
		else
			LuaUI.SetTempResult(3); -- 必须为同等级同类型的宝石才可以进行合成
			return ;
		end
	else
		LuaUI.SetTempResult(3); -- 必须为同等级同类型的宝石才可以进行合成
		return ;
	end
	
	LuaUI.SetTempResult(4); -- 无法合成宝石
end

function IsGemInlayConsumeItem(ItemId) -- 是否镶嵌符
	if ItemId == 60310 then
		return true;
	else
		return false;
	end
end

function IsGemRemoveConsumeItem(ItemId) -- 是否摘除符
	if ItemId == 60320 then
		return true;
	else
		return false;
	end
end

function CheckGemInlayEqItem(EqItemId, InlayGemCount, ItemLock, Identify)
	local Re = 0;
	if ItemLock == true then
		Re = 1 -- 已上锁的道具不可以进行镶嵌
	elseif Identify == false then
		Re = 2; -- 未鉴定的道具不可以进行镶嵌
	elseif InlayGemCount < 0 or InlayGemCount >= 1 then
		Re = 3; -- 最大镶嵌的宝石个数
	end

	LuaUI.SetTempResult(Re);
end

function GetMixShopInlayGemType(GemItemId)
	local GemType = 0; -- Gem Type : 1=atk, 2=def, 3=pow, 4=maxHp, 5=maxSp, 6=hit, 7=eva, 8=spd
	if (GemItemId >= 60011 and GemItemId <= 60020) or (GemItemId >= 60401 and GemItemId <= 60410) then
		GemType = 1; -- atk
	elseif (GemItemId >= 60021 and GemItemId <= 60030) or (GemItemId >= 60411 and GemItemId <= 60420) then
		GemType = 2; -- def
	elseif (GemItemId >= 60031 and GemItemId <= 60040) or (GemItemId >= 60421 and GemItemId <= 60430) then
		GemType = 6; -- hit
	elseif (GemItemId >= 60041 and GemItemId <= 60050) or (GemItemId >= 60431 and GemItemId <= 60440) then
		GemType = 7; -- eva
	elseif (GemItemId >= 60051 and GemItemId <= 60060) or (GemItemId >= 60441 and GemItemId <= 60450) then
		GemType = 3; -- pow
	elseif (GemItemId >= 60061 and GemItemId <= 60070) or (GemItemId >= 60451 and GemItemId <= 60460) then
		GemType = 8; -- spd
	elseif (GemItemId >= 60071 and GemItemId <= 60080) or (GemItemId >= 60461 and GemItemId <= 60470) then
		GemType = 4; -- maxHp
	elseif (GemItemId >= 60081 and GemItemId <= 60090) or (GemItemId >= 60471 and GemItemId <= 60480) then
		GemType = 5; -- maxSp
	end
	
	if (GemItemId >= 60711 and GemItemId <= 60720) or (GemItemId >= 60801 and GemItemId <= 60810) then
		GemType = 1; -- atk
	elseif (GemItemId >= 60721 and GemItemId <= 60730) or (GemItemId >= 60811 and GemItemId <= 60820) then
		GemType = 2; -- def
	elseif (GemItemId >= 60731 and GemItemId <= 60740) or (GemItemId >= 60821 and GemItemId <= 60830) then
		GemType = 6; -- hit
	elseif (GemItemId >= 60741 and GemItemId <= 60750) or (GemItemId >= 60831 and GemItemId <= 60840) then
		GemType = 7; -- eva
	elseif (GemItemId >= 60751 and GemItemId <= 60760) or (GemItemId >= 60841 and GemItemId <= 60850) then
		GemType = 3; -- pow
	elseif (GemItemId >= 60761 and GemItemId <= 60770) or (GemItemId >= 60851 and GemItemId <= 60860) then
		GemType = 8; -- spd
	elseif (GemItemId >= 60771 and GemItemId <= 60780) or (GemItemId >= 60861 and GemItemId <= 60870) then
		GemType = 4; -- maxHp
	elseif (GemItemId >= 60781 and GemItemId <= 60790) or (GemItemId >= 60871 and GemItemId <= 60880) then
		GemType = 5; -- maxSp
	elseif GemItemId >= 92001 and GemItemId <= 92020 then
		GemType = 4; -- maxHp
	end

	LuaUI.SetTempResult(GemType);
	return GemType;
end

function CheckGemInlayGemItem(EqItemId, EqType, EqReqLv, InlayGemId, GemItemId, GemItemLock)
	local Re = 0;
	if EqItemId == 0 then
		Re = 1; -- 请先放入需要镶嵌的装备
	else
		if GemItemLock == true then
			Re = 6; -- 已锁定的宝石不能镶嵌
		else
			local GemLevel = GetGemItemLevel(GemItemId);
			if EqReqLv <= 50 and GemLevel > 5 then
				Re = 2; -- 60级以下（包括60级）的装备最多镶嵌5级宝石
			elseif EqReqLv >= 70 and EqReqLv <= 80 and GemLevel > 6 then
				Re = 3; -- 70-80级装备（包括70、80级）最多镶嵌6级宝石
			end

			if Re == 0 then
				if EqItemId ~= 0 then

					-- Gem Type : 1=atk, 2=def, 3=pow, 4=maxHp, 5=maxSp, 6=hit, 7=eva, 8=spd
					local GemType = GetMixShopInlayGemType(GemItemId);
					local InlayGemType = GetMixShopInlayGemType(InlayGemId);

					if (InlayGemType ~= 0 and InlayGemType == GemType) then
						Re = 4; -- 每件装备可镶嵌同种类型宝石的数量最多为1个
					else
						if (EqType >= 0 and EqType <= 9) then -- atk , hit 武器
							if (GemType ~= 1 and GemType ~= 6 and GemType ~= 7 and GemType ~= 5 ) then
								Re = 7; -- 镶嵌的宝石种类错误
							end
						elseif (EqType == 10 or EqType == 17 or EqType == 18)  then -- atk, maxHp 头盔
							if (GemType ~= 1 and GemType ~= 5 and GemType ~= 2 and GemType ~= 6) then
								Re = 8;
							end
						elseif (EqType == 11 or EqType == 16) then -- def, maxHp 衣服
							if (GemType ~= 2 and GemType ~= 4 and GemType ~= 3) then
								Re = 9;
							end
						elseif (EqType == 13) then -- maxHp, pow 腰带
							if (GemType ~= 4 and GemType ~= 8 ) then
								Re = 10;
							end
						elseif (EqType == 14) then -- maxSp, pow eva 项链
							if ( GemType ~= 3 and GemType ~= 5 and GemType ~= 7) then
								Re = 11;
							end
						elseif (EqType == 12) then -- spd, eva 鞋子
							if (GemType ~= 8 and GemType ~= 7) then
								Re = 12;
							end
						else
							Re = 5; -- 装备类型错误
						end
					end
				end
			end
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function CheckGemInlayConsumeItem(EqItemId, EqType, InlayGemId, GemItemId, ConsumeItemId)
	local Re = 0;
	if EqItemId == 0 then
		Re = 1; -- 请先放入需要镶嵌的装备
	else
		if GemItemId == 0 then
			Re = 2; -- 请先放入需要镶嵌的宝石
		else
			if IsGemInlayConsumeItem(ConsumeItemId) then
				if GemItemId ~= 0 then -- check gem item level(id)
					local ConsumeItemLevel = GetGemItemLevel(ConsumeItemId);
					local GemLevel = GetGemItemLevel(GemItemId);
					if ConsumeItemLevel < GemLevel then
						Re = 3; -- 使用的宝石镶嵌符的等级必须大于等于待镶嵌的宝石等级才可以进行镶嵌
					end
				end
			else
				Re = 4; -- 请放入镶嵌符
			end
		end
	end

	LuaUI.SetTempResult(Re);
end

function CheckGemRemoveEqItem(EqItemId, InlayGemCount, ItemLock)
	local Re = 0;
	if EqItemId == 0 then
		Re = 1; -- 请先放入需要摘除宝石的装备
	else
		if InlayGemCount <= 0 then
			Re = 2; -- 装备没有镶嵌宝石
		elseif ItemLock == true then
			Re = 3; -- 已上锁的装备不可以进行就宝石摘除
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function CheckGemRemoveConsumeItem(EqItemId, RemoveGemItemId, ConsumeItemId)
	local Re = 0;
	if EqItemId == 0 then
		Re = 1; -- 请先放入需要摘除宝石的装备
	else
		if RemoveGemItemId == 0 then
			Re = 2; -- 你必须先选择一个已嵌入的宝石
		else
			if IsGemRemoveConsumeItem(ConsumeItemId) then
				local RemoveGemItemLevel = GetGemItemLevel(RemoveGemItemId);
				local ConsumeItemLevel = GetGemItemLevel(ConsumeItemId);
				
				if RemoveGemItemLevel > ConsumeItemLevel then
					Re = 4; -- 使用的宝石摘除符的等级必须大于等于待摘除的宝石等级才可以进行摘除
				end
			else
				Re = 3; -- 请放入宝石摘除符
			end
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function CheckGemMeltingGemItem(GemItemId, ItemLock)
	local Re = 0;
	
	if ItemLock == true then
		Re = 1; -- 已锁定的宝石不能熔炼
	else
		if GemItemId == 60011 or GemItemId == 60012
		or GemItemId == 60401 or GemItemId == 60402
		or GemItemId == 60021 or GemItemId == 60022
		or GemItemId == 60411 or GemItemId == 60412
		or GemItemId == 60031 or GemItemId == 60032
		or GemItemId == 60421 or GemItemId == 60422
		or GemItemId == 60041 or GemItemId == 60042
		or GemItemId == 60431 or GemItemId == 60432
		or GemItemId == 60051 or GemItemId == 60052
		or GemItemId == 60441 or GemItemId == 60442
		or GemItemId == 60061 or GemItemId == 60062
		or GemItemId == 60451 or GemItemId == 60452
		or GemItemId == 60071 or GemItemId == 60072
		or GemItemId == 60461 or GemItemId == 60462
		or GemItemId == 60081 or GemItemId == 60082
		or GemItemId == 60471 or GemItemId == 60472 then
			Re = 0; -- ok
		else
			Re = 2; -- 此宝石不能熔炼
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function GetGemMeltingConsumeMoney(GemItemId)
	local GemItemLevel = GetGemItemLevel(GemItemId);
	local ConsumeMoney = GemItemLevel * 1000;
	LuaUI.SetTempResult(ConsumeMoney);
	return ConsumeMoney;
end

function CheckGemPolishingGemItem(GemItemId, ItemLock)
	local Re = 0;
	
	if ItemLock == true then
		Re = 1; -- 已锁定的宝石不能抛光
	else
		if (GemItemId >= 60011 and GemItemId <= 60020) or (GemItemId >= 60401 and GemItemId <= 60410) then
			Re = 0;
		elseif (GemItemId >= 60021 and GemItemId <= 60030) or (GemItemId >= 60411 and GemItemId <= 60420) then
			Re = 0;
		elseif (GemItemId >= 60031 and GemItemId <= 60040) or (GemItemId >= 60421 and GemItemId <= 60430) then
			Re = 0;
		elseif (GemItemId >= 60041 and GemItemId <= 60050) or (GemItemId >= 60431 and GemItemId <= 60440) then
			Re = 0;
		elseif (GemItemId >= 60051 and GemItemId <= 60060) or (GemItemId >= 60441 and GemItemId <= 60450) then
			Re = 0;
		elseif (GemItemId >= 60061 and GemItemId <= 60070) or (GemItemId >= 60451 and GemItemId <= 60460) then
			Re = 0;
		elseif (GemItemId >= 60071 and GemItemId <= 60080) or (GemItemId >= 60461 and GemItemId <= 60470) then
			Re = 0;
		elseif (GemItemId >= 60081 and GemItemId <= 60090) or (GemItemId >= 60471 and GemItemId <= 60480) then
			Re = 0;
		else
			Re = 2; -- 此宝石不能抛光
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function IsGemPolishingConsumeItem(ConsumeItemId)
	if ConsumeItemId >= 60601 and ConsumeItemId <= 60610 then
		return true;
	elseif ConsumeItemId >= 60611 and ConsumeItemId <= 60620 then
		return true;
	else
		return false;
	end
end

function CheckGemPolishingConsumeItem(GemItemId, ConsumeItemId)
	local Re = 0;
	
	if GemItemId == 0 then
		Re = 1; -- 请先放入宝石
	else
		if IsGemPolishingConsumeItem(ConsumeItemId) then
			local ConsumeItemLevel = GetGemItemLevel(ConsumeItemId);
			local GemItemLevel = GetGemItemLevel(GemItemId);
			
			if ConsumeItemLevel >= GemItemLevel then
				Re = 0;
			else
				Re = 3; -- 放入的抛光石等级需大于等于宝石的等级
			end
		else
			Re = 2; -- 请放入抛光石
		end
	end
	
	LuaUI.SetTempResult(Re);
end

function GetGemPolishingConsumeMoney(GemItemId)
	local GemItemLevel = GetGemItemLevel(GemItemId);
	local ConsumeMoney = GemItemLevel * 1000;
	LuaUI.SetTempResult(ConsumeMoney);
	return ConsumeMoney;
end

function GetGemPolishingResultGemItemId(GemItemId, Bound)
	local ResultGemItemId = 0;
	
	if GemItemId >= 60011 and GemItemId <= 60090 then -- unbound
		ResultGemItemId = GemItemId + 700;
		if Bound then
			ResultGemItemId = ResultGemItemId + 90;
		end
	elseif GemItemId >= 60401 and GemItemId <= 60480 then -- bound
		ResultGemItemId = GemItemId + 400;
	end
	
	LuaUI.SetTempResult(ResultGemItemId);
end

function GetNativeUpByCultivation(cultivation)
	if cultivation < 1 or cultivation > 10 then
		LuaUI.SetTempResult(0);
		return 0;
	end

	local NativeUpByCultivation = {5, 15, 30, 50, 75, 105, 140, 180, 225, 275};
	LuaUI.SetTempResult(NativeUpByCultivation[cultivation]);
	return NativeUpByCultivation[cultivation];
end

function CanInlayGamItemType(EqType,GemType)
	local Re = 0; --不能镶嵌宝石
	if (EqType >= 0 and EqType <= 9) then -- atk , hit
		if (GemType == 1 or GemType == 6) then
			Re = 1; --能镶嵌宝石
		end
	elseif (EqType == 10 or EqType == 17 or EqType == 18)  then -- atk, maxHp
		if (GemType == 1 or GemType == 4) then
			Re = 1;
		end
	elseif (EqType == 11 or EqType == 16) then -- def, maxHp
		if (GemType == 2 or GemType == 4 or GemType == 1  or GemType == 4) then
			Re = 1;
		end
	elseif (EqType == 13) then -- def, pow
		if (GemType == 2 or GemType == 3) then
			Re = 1;
		end
	elseif (EqType == 14) then -- maxSp, pow
		if (GemType == 5 or GemType == 3) then
			Re = 1;
		end
	elseif (EqType == 12) then -- spd, eva
		if (GemType == 8 or GemType == 7) then
			Re = 1;
		end
	else
		Re = 0; -- 装备类型错误
	end
	LuaUI.SetTempResult(Re);
end