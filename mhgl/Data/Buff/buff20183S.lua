 
--ÌìËÉ
function buff20183Add(buff, Char) 

end

function buff20183Attri(Char, buff, Attri)

	local Atk = Attri:GetAtk()-45
	if Atk > 5 then
		Attri:SetAtk(Atk)
	elseif Atk <= 5 then
		Attri:SetAtk(5)
	end
end


function buff20183Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
