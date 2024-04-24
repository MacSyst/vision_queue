Config = {}

Config.startup = true
Config.discord = true
Config.webhook = ""
Config.queueTime = 5	
Config.maxPlayers = 48


local DISCORD_WEBHOOK_URL = Config.webhook
local DISOCRD_THUMBNAIL = Config.thumbnail
local queueTime = Config.queueTime
local maxPlayers = Config.maxPlayers
local queue = {}


if Config.startup then
    print("^9-----------------------------------------------------------------------------^0")
    print("##     ## ####  ######  ####  #######  ##    ##  #######  ##     ## ######## ##     ## ######## ")    
    print("##     ##  ##  ##    ##  ##  ##     ## ###   ## ##     ## ##     ## ##       ##     ## ##       ")
    print("##     ##  ##  ##        ##  ##     ## ####  ## ##     ## ##     ## ##       ##     ## ##       ")
    print("##     ##  ##   ######   ##  ##     ## ## ## ## ##     ## ##     ## ######   ##     ## ######   ")
    print(" ##   ##   ##        ##  ##  ##     ## ##  #### ##  ## ## ##     ## ##       ##     ## ##       ")
    print("  ## ##    ##  ##    ##  ##  ##     ## ##   ### ##    ##  ##     ## ##       ##     ## ##       ")
    print("   ###    ####  ######  ####  #######  ##    ##  ##### ##  #######  ########  #######  ######## ")
    print("^9-----------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Author^0]^1 Benrizzz^0")
    print("[^6VisionQueue^0 - ^6Version^0]^1 1.0.1^0")
    print("[^6VisionQueue^0 - ^6Github^0]^1 Github.com/VisionQueue^0")
    print("^9-----------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Startup^0] ^4server.lua ^2Loaded!^0")
end

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local source = source
    local queuePosition = #queue + 1
    local identifier = GetPlayerIdentifierByType(source, "license"):gsub("license", "char1")
    -- gsub ist da um denn string zu ändern von license: zu char1:

    local row = MySQL.single.await('SELECT `firstname`, `lastname`, `group`, `job`, `position`, `dateofbirth`, `height`, `sex` FROM `users` WHERE `identifier` = ? LIMIT 1', {identifier})
    local times = MySQL.single.await('SELECT * FROM `vision_users` WHERE `identifier` = ?', {identifier})

    if queuePosition <= maxPlayers then
        table.insert(queue, source)
        deferrals.defer()
        deferrals.update(("Du bist in der Warteschlange. Position: %d/%d"):format(queuePosition, maxPlayers))
        
        Citizen.Wait(queueTime * 1000)
        deferrals.update("Du wirst verbunden.\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐵🐺🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐵🐺🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐵🐺🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden.\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐵🐺🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🦝🐱🐵🐺]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🦝🐱🐵🐺]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🦝🐱🐵🐺]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🦝🐱🐵🐺]")
        Wait(250)
        deferrals.update("Du wirst verbunden.\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐺🐵🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐺🐵🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐺🐵🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐱🐺🐵🦝]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐵🐺🦝🐱]")
        Wait(250)
        deferrals.update("Du wirst verbunden.\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐵🐺🦝🐱]")
        Wait(250)
        deferrals.update("Du wirst verbunden..\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐵🐺🦝🐱]")
        Wait(250)
        deferrals.update("Du wirst verbunden...\n Wenn die Emojis sich nicht Aktualsieren bitte versuche es erneut.\n [🐵🐺🦝🐱]")
        deferrals.done()
    else
        deferrals.done("Der Server ist voll. Bitte versuche es später erneut.")
    end

if Config.discord then
    local discordMessage = {
        embeds = {{
            title = "VisionQueue - Joined",
            description = "Player Joined!",
            fields = {
                {name = "Player:", value = "```" ..identifier.. "```"},
                {name = "Firstname:", value = "```" ..row.firstname.. "```"},
                {name = "Lastname:", value = "```" ..row.lastname.. "```"},
                {name = "Date of Birth:", value = "```" ..row.dateofbirth.. "```"},
                {name = "Height:", value = "```" ..row.height.. "```"},
                {name = "Sex:", value = "```" ..row.sex.. "```"},
                {name = "Group:", value = "```" ..row.group.. "```"},
                {name = "Job:", value = "```" ..row .job.. "```"},
                {name = "Position:", value = "```" ..row.position.. "```"}
            },
            thumbnail = {url = DISOCRD_THUMBNAIL},
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            color = 0x808080
        }}
    }
    PerformHttpRequest(DISCORD_WEBHOOK_URL, function(err, text, headers) end, 'POST', json.encode(discordMessage), {['Content-Type'] = 'application/json'})
end
     
    if not row then
        print("[^6VisionQueue^0 - ^6Queue^0] ^0Player ^1"..identifier:gsub("char1", "license").."^0 connected, name: ^1"..GetPlayerName(source).."^0")
        return
    end

    print("^6----------------------------------------------------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Player: ^1"..identifier:gsub("char1", "license").."^0")
    print("^6----------------------------------------------------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Firstname: ^1"..row.firstname.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Lastname: ^1"..row.lastname.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0birthday: ^1"..row.dateofbirth.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Height: ^1"..row.height.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Sex: ^1"..row.sex:gsub("m", "Male"):gsub("f", "Female").."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Group: ^1"..row.group.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0time: ^1"..times.time.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Job: ^1"..row.job.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Position: ^1"..row.position.."^0")
    print("^6----------------------------------------------------------------------------------------------------------------------^0")
end)

AddEventHandler("playerDropped", function(reason)
    local source = source
    local identifier = GetPlayerIdentifierByType(source, "license")
    local time = os.date('%x %X')

    local playercount = MySQL.query.await('SELECT COUNT(*) FROM `vision_users` WHERE `identifier` = ?', {identifier})
    if playercount == 0 then
        local times = MySQL.insert.await('INSERT INTO `vision_users` (identifier, time) VALUES (?, ?)', {identifier, time})
    else
        local times = MySQL.update.await('UPDATE `vision_users` SET `time` = ? WHERE `identifier` = ?', {identifier, time})	
    end
    for i, id in ipairs(queue) do
        if id == source then
            table.remove(queue, i)
            break
        end
    end
end)
