local DISCORD_WEBHOOK_URL = Config.webhook
local DISOCRD_THUMBNAIL = Config.thumbnail
local queueTime = Config.queueTime
local maxPlayers = Config.maxPlayers
local queue = {}
local lastseen = {}

SetConvarServerInfo('tags', 'Vision-Scripts')

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
    local row = MySQL.single.await('SELECT `firstname`, `lastname`, `group`, `job`, `position`, `dateofbirth`, `height`, `sex`, `last_seen`, `created_at` FROM `users` WHERE `identifier` = ? LIMIT 1', {
        identifier
    })

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
                {name = "LastSeen:", value = "```" ..row.last_seen.. "```"},
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

    function convertTimestampToReadable(timestamp)
        local seconds = timestamp / 1000
        return os.date("%d.%m.%Y %A | %H:%M", seconds)
    end

    local row_created_at = row.created_at
    local row_last_seen = row.last_seen
    local last_seen_date = convertTimestampToReadable(row_last_seen)
    local first_join_date = convertTimestampToReadable(row_created_at)

    print("^6----------------------------------------------------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Player: ^1"..identifier:gsub("char1", "license").."^0")
    print("^6----------------------------------------------------------------------------------------------------------------------^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Firstname: ^1"..row.firstname.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Lastname: ^1"..row.lastname.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0birthday: ^1"..row.dateofbirth.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Height: ^1"..row.height.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Sex: ^1"..row.sex:gsub("m", "Male"):gsub("f", "Female").."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Group: ^1"..row.group.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Job: ^1"..row.job.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Last seen: ^1"..last_seen_date.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Created at: ^1"..first_join_date.."^0")
    print("[^6VisionQueue^0 - ^6Queue^0] ^0Position: ^1"..row.position.."^0")
    print("^6----------------------------------------------------------------------------------------------------------------------^0")
end)

AddEventHandler("playerDropped", function(reason)
    local source = source
    for i, id in ipairs(queue) do
        if id == source then
            table.remove(queue, i)
            break
        end
    end
end)
