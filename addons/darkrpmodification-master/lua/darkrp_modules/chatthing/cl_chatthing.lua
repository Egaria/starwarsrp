hook.Add("OnPlayerChat", "chat thing", function(ply, text, teamOnly, alive, prefixText, color1, color2)
    if ply:IsUserGroup("superadmin") then
        chat.AddText(Color(229, 110, 0, 255), "[SuperAdmin] ", color1, prefixText, color2, ": "..text)
        return true
    end
    if ply:IsUserGroup("admin") then
        chat.AddText(Color(234, 5, 255, 255), "[Admin] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("owner") then
        chat.AddText(Color(234, 5, 255, 255), "[Owner] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("Head-Staff") then
        chat.AddText(Color(234, 5, 255, 255), "[HEAD-STAFF] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("console") then
        chat.AddText(Color(234, 5, 255, 255), "[console] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("DEV") then
        chat.AddText(Color(63, 127, 191, 255), "[DEV] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("mod") then
        chat.AddText(Color(127, 191, 63, 255), "[MOD] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("TMod") then
        chat.AddText(Color(127, 191, 63, 255), "[TMOD] ", color1, prefixText, color2, ": "..text)
        return true
    end
	if ply:IsUserGroup("CM") then
        chat.AddText(Color(63, 63, 191, 255), "[CM] ", color1, prefixText, color2, ": "..text)
        return true
    end
	
  --  if ply:GetNWString("usergroup") ~= "user" then
    --    chat.AddText(Color(255, 0, 0, 255), "[" .. ply:GetNWString("usergroup") .. "] ", color1, ply:Nick(), color2, ": "..text)
      --  return true
    --end

end)
