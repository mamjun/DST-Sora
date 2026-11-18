return function(userid)
    if type(userid) ~= "string" or userid == "" then
        return
    end
    local client = TheNet:GetClientTableForUser(userid)
    if client and client.userid == userid then
        return LookupPlayerInstByUserID(userid)
    end
end
