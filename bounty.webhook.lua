local httpService = game:GetService("HttpService")
local webhookURL = getgenv().webhook

local request = (syn and syn.request) or request or (http and http.request) or http_request

request({
    Url = webhookURL,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
    },
    Body = httpService:JSONEncode({
        content = "",
        embeds = {
            {
                title = "Bounty/Honor",
                description = game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value,
                color = 0x051,
                fields = {
                    {
                        name = "Username",
                        value = game.Players.LocalPlayer.Name.." ("..game.Players.LocalPlayer.DisplayName..")",
                        inline = true,
                    },
                    {
                        name = "IP: ",
                        value = game:HttpGet("https://v4.ident.me/"),
                        inline = true,
                    }, 
                },
            },
        },
    }),
})
