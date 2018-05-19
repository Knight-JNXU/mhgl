--author: hula
--金柳露指定同伴后右击使用：只能对携带要求不大于35级的紫人形同伴使用，等级归0，各项能力重新生成
--北方修改  2009-0-23
Item30000 = {
}

function Item30000:MapUse(target)
	local mobid = target:GetMob_id()	
	  
	local PartnerTable = { 
						[1] = 298,
						[2] = 299,
						[5] = 300,
						[6] = 302,
						[7] = 301,
						[8] = 298,
						[9] = 299,
						[10] = 298,
						[11] = 299,
						[16] = 300,
						[17] = 300,
						[18] = 301,
						[19] = 301,
						[20] = 301,
						[21] = 302,
						[22] = 302,
						[23] = 302,
						[24] = 310,
						[25] = 310,
						[26] = 310	,				
						[27] = 311,
						[28] = 311,
						[29] = 311	,				 
						[30] = 309,
						[31] = 309,
						[32] = 309	,											
						[33] = 316,
						[34] = 316,
						[35] = 316	,					
						--[36] = 441,
						--[37] = 441,
						--[38] = 441	,					
						[39] = 315,
						[40] = 315,
						[41] = 315	,					
						[42] = 312,
						[43] = 312,
						[44] = 312	,					
						[45] = 307,
						[46] = 307,
						[47] = 307	,					
						--[48] = 441,
						[49] = 306,
						[50] = 306,
						[51] = 306	,											
						[52] = 356,
						[53] = 356,
						[54] = 356	,					
						[55] = 319,
						[56] = 319,
						[57] = 319	,					
						[58] = 320,
						[59] = 320,
						[60] = 320	,					
						[61] = 321,
						[62] = 321,
						[63] = 321 ,					
						[64] = 350,
						[65] = 350,
						[66] = 350	,					
						[67] = 354,
						[68] = 354,
						[69] = 354	,					
						[70] = 355,
						[71] = 355,
						[72] = 355	,					
						[73] = 349,
						[74] = 349,
						[75] = 349	,											
						[76] = 352,
						[77] = 352,
						[78] = 352	,					
						[79] = 314,
						[80] = 314,
						[81] = 314	,					
						[82] = 303,
						[83] = 303,
						[84] = 303	,					
						[85] = 313,
						[86] = 313,
						[87] = 313	,					
						[88] = 351,
						[89] = 351,
						[90] = 351	,					
						[91] = 317,
						[92] = 317,
						[93] = 317	,					
						[94] = 318,
						[95] = 318,
						[96] = 318	,					
						--[97] = 441,
						--[98] = 441,
						--[99] = 441	,					
						[100] = 322,
						[101] = 322,
						[102] = 322	,					
						[103] = 324,
						[104] = 324,
						[105] = 324	,					
						[106] = 323,
						[107] = 323,
						[108] = 323	,					
						[109] = 331,
						[110] = 331,
						[111] = 331	,					
						--[112] = 441,
						--[113] = 441,
						--[114] = 441	,					
						[115] = 325,
						[116] = 325,
						[117] = 325	,					
						[118] = 330,
						[119] = 330,
						[120] = 330	,					
						[121] = 353,
						[122] = 353,
						[123] = 353	,					
						[124] = 326,
						[125] = 326,
						[126] = 326	,					
						[127] = 327,
						[128] = 327,
						[129] = 327	,					
						[130] = 304,
						[131] = 304,
						[132] = 304	,					
						[133] = 328,
						[134] = 328,
						[135] = 328	,					
						[136] = 329,
						[137] = 329,
						[138] = 329	,					
						[139] = 335,
						[140] = 335,
						[141] = 335	,					
						[142] = 334,
						[143] = 334,
						[144] = 334	,					
						[145] = 336,
						[146] = 336,
						[147] = 336	,					
						[148] = 357,
						[149] = 357,
						[150] = 357	,					
						[151] = 337,
						[152] = 337,
						[153] = 337	,					
						[154] = 338,
						[155] = 338,
						[156] = 338	,					
						[157] = 339,
						[158] = 339,
						[159] = 339	,					
						[160] = 332,
						[161] = 332,
						[162] = 332	,					
						[163] = 333,
						[164] = 333,
						[165] = 333	,					
						--[166] = 441,
						--[167] = 441,
						--[168] = 441	,					
						[169] = 346,
						[170] = 346,
						[171] = 346,
						[172] = 347,
						[173] = 347,
						[174] = 347,
						[395] = 396,
						[397] = 399,
						[398] = 399,
						[401] = 404,
						[402] = 404,
						[403] = 404,
						[405] = 404,
						[406] = 409,
						[407] = 409,
						[408] = 409,
						[410] = 409,
						[411] = 414,
						[412] = 414,
						[413] = 414,
						[415] = 414,
						[416] = 419,
						[417] = 419,
						[418] = 419,
						[420] = 419,
						[421] = 424,
						[422] = 424,
						[423] = 424,
						[425] = 424,
						[426] = 428,
						[427] = 428,
						[429] = 428

						
						
						}
						
						
	if target and target:GetUserType() == 2 then --同伴	
		if target:GetLock() then 
			ShowHint("#R已上锁的召唤兽无法使用")
			return
		end	
		if target:GetRace() == 4 then
			ShowHint("#R金柳露只能对普通召唤兽使用")
			return
		end
		for i=372,359,-1 do
		  if mobid == i then
		    ShowHint("#R神兽不能使用金柳露#46")
		    return
		  end
		end
		ItemAsk(string.format("你确定要让\#P%s\#W使用金柳露吗？", target:GetName()))
		SetAnswer(1, "确定")
		SetAnswer(2, "取消")			
		WaitAnswer(2)
		if GetAnswer() == 1 then		
			if target:GetReqLv() >= 155 then
			  ShowHint("#R金柳露只能对携带要求不大于75级的召唤兽使用")
			  return
			end
			if not item:ReduceCount() then return end
			local r = math.random(0, 100)
			if r <= 2 and mobid and target:GetRace()== 1 and PartnerTable[mobid] ~= nil then --百分之2的几率生成变异宝宝				
				player:GetPartners():RemovePartner(target)
				player:GetPartners():AddPartner(PartnerTable[mobid]) --变异宝宝ID
		    ShowHint("服用过金柳露后你的召唤兽竟然变异了！")	
		    script:Rumor(string.format(" %s #W对#O%s#W使用了金柳露,竟然发生了变异#24", player:GetCharNameLink(),target:GetName()), true)
			elseif r <= 3 and mobid and target:GetRace()== 2 and PartnerTable[mobid] ~= nil then --百分之2的几率生成变异宝宝				
				player:GetPartners():RemovePartner(target)
				player:GetPartners():AddPartner(PartnerTable[mobid]) --变异宝宝ID
		    ShowHint("服用过金柳露后你的召唤兽竟然变异了！")	
		    script:Rumor(string.format(" %s #W对#O%s#W使用了金柳露,竟然发生了变异#24", player:GetCharNameLink(),target:GetName()), true)
			else			
				target:ResetPartner()			--!!!!!! 等级变为0级，各项能力重新生成
				local Practice = target:GetPractice()
				if Practice > 0 then
				   target:ChangePractice(-1*Practice)
				   local x = math.random(0, 100)
				   if x <= 3 then
				      Practice = math.random(0, 3)
					  target:ChangePractice(Practice)
				   end
				end
				
			  ShowHint("服用过金柳露后你的召唤兽已脱胎换骨")		
	    end
	  end
	else
	  ShowHint("金柳露只能对召唤兽使用")
	end
end--]]

function Item30000:CanUse(user, target)
end

function Item30000:BattleUse(user, target)

end

AddItemTable(Item30000)