---@diagnostic disable: lowercase-global
urand            = assert(io.open('/dev/urandom', 'rb'))
rand             = assert(io.open('/dev/random', 'rb'))
local Vector     = require("vector")
local Luafinding = require("luafinding")
statusSocket     = nil

speciesNames = {
    "??????????",
    "BULBASAUR",
    "IVYSAUR",
    "VENUSAUR",
    "CHARMANDER",
    "CHARMELEON",
    "CHARIZARD",
    "SQUIRTLE",
    "WARTORTLE",
    "BLASTOISE",
    "CATERPIE",
    "METAPOD",
    "BUTTERFREE",
    "WEEDLE",
    "KAKUNA",
    "BEEDRILL",
    "PIDGEY",
    "PIDGEOTTO",
    "PIDGEOT",
    "RATTATA",
    "RATICATE",
    "SPEAROW",
    "FEAROW",
    "EKANS",
    "ARBOK",
    "PIKACHU",
    "RAICHU",
    "SANDSHREW",
    "SANDSLASH",
    "NIDORAN♀",
    "NIDORINA",
    "NIDOQUEEN",
    "NIDORAN♂",
    "NIDORINO",
    "NIDOKING",
    "CLEFAIRY",
    "CLEFABLE",
    "VULPIX",
    "NINETALES",
    "JIGGLYPUFF",
    "WIGGLYTUFF",
    "ZUBAT",
    "GOLBAT",
    "ODDISH",
    "GLOOM",
    "VILEPLUME",
    "PARAS",
    "PARASECT",
    "VENONAT",
    "VENOMOTH",
    "DIGLETT",
    "DUGTRIO",
    "MEOWTH",
    "PERSIAN",
    "PSYDUCK",
    "GOLDUCK",
    "MANKEY",
    "PRIMEAPE",
    "GROWLITHE",
    "ARCANINE",
    "POLIWAG",
    "POLIWHIRL",
    "POLIWRATH",
    "ABRA",
    "KADABRA",
    "ALAKAZAM",
    "MACHOP",
    "MACHOKE",
    "MACHAMP",
    "BELLSPROUT",
    "WEEPINBELL",
    "VICTREEBEL",
    "TENTACOOL",
    "TENTACRUEL",
    "GEODUDE",
    "GRAVELER",
    "GOLEM",
    "PONYTA",
    "RAPIDASH",
    "SLOWPOKE",
    "SLOWBRO",
    "MAGNEMITE",
    "MAGNETON",
    "FARFETCH'D",
    "DODUO",
    "DODRIO",
    "SEEL",
    "DEWGONG",
    "GRIMER",
    "MUK",
    "SHELLDER",
    "CLOYSTER",
    "GASTLY",
    "HAUNTER",
    "GENGAR",
    "ONIX",
    "DROWZEE",
    "HYPNO",
    "KRABBY",
    "KINGLER",
    "VOLTORB",
    "ELECTRODE",
    "EXEGGCUTE",
    "EXEGGUTOR",
    "CUBONE",
    "MAROWAK",
    "HITMONLEE",
    "HITMONCHAN",
    "LICKITUNG",
    "KOFFING",
    "WEEZING",
    "RHYHORN",
    "RHYDON",
    "CHANSEY",
    "TANGELA",
    "KANGASKHAN",
    "HORSEA",
    "SEADRA",
    "GOLDEEN",
    "SEAKING",
    "STARYU",
    "STARMIE",
    "MR. MIME",
    "SCYTHER",
    "JYNX",
    "ELECTABUZZ",
    "MAGMAR",
    "PINSIR",
    "TAUROS",
    "MAGIKARP",
    "GYARADOS",
    "LAPRAS",
    "DITTO",
    "EEVEE",
    "VAPOREON",
    "JOLTEON",
    "FLAREON",
    "PORYGON",
    "OMANYTE",
    "OMASTAR",
    "KABUTO",
    "KABUTOPS",
    "AERODACTYL",
    "SNORLAX",
    "ARTICUNO",
    "ZAPDOS",
    "MOLTRES",
    "DRATINI",
    "DRAGONAIR",
    "DRAGONITE",
    "MEWTWO",
    "MEW",
    "CHIKORITA",
    "BAYLEEF",
    "MEGANIUM",
    "CYNDAQUIL",
    "QUILAVA",
    "TYPHLOSION",
    "TOTODILE",
    "CROCONAW",
    "FERALIGATR",
    "SENTRET",
    "FURRET",
    "HOOTHOOT",
    "NOCTOWL",
    "LEDYBA",
    "LEDIAN",
    "SPINARAK",
    "ARIADOS",
    "CROBAT",
    "CHINCHOU",
    "LANTURN",
    "PICHU",
    "CLEFFA",
    "IGGLYBUFF",
    "TOGEPI",
    "TOGETIC",
    "NATU",
    "XATU",
    "MAREEP",
    "FLAAFFY",
    "AMPHAROS",
    "BELLOSSOM",
    "MARILL",
    "AZUMARILL",
    "SUDOWOODO",
    "POLITOED",
    "HOPPIP",
    "SKIPLOOM",
    "JUMPLUFF",
    "AIPOM",
    "SUNKERN",
    "SUNFLORA",
    "YANMA",
    "WOOPER",
    "QUAGSIRE",
    "ESPEON",
    "UMBREON",
    "MURKROW",
    "SLOWKING",
    "MISDREAVUS",
    "UNOWN",
    "WOBBUFFET",
    "GIRAFARIG",
    "PINECO",
    "FORRETRESS",
    "DUNSPARCE",
    "GLIGAR",
    "STEELIX",
    "SNUBBULL",
    "GRANBULL",
    "QWILFISH",
    "SCIZOR",
    "SHUCKLE",
    "HERACROSS",
    "SNEASEL",
    "TEDDIURSA",
    "URSARING",
    "SLUGMA",
    "MAGCARGO",
    "SWINUB",
    "PILOSWINE",
    "CORSOLA",
    "REMORAID",
    "OCTILLERY",
    "DELIBIRD",
    "MANTINE",
    "SKARMORY",
    "HOUNDOUR",
    "HOUNDOOM",
    "KINGDRA",
    "PHANPY",
    "DONPHAN",
    "PORYGON2",
    "STANTLER",
    "SMEARGLE",
    "TYROGUE",
    "HITMONTOP",
    "SMOOCHUM",
    "ELEKID",
    "MAGBY",
    "MILTANK",
    "BLISSEY",
    "RAIKOU",
    "ENTEI",
    "SUICUNE",
    "LARVITAR",
    "PUPITAR",
    "TYRANITAR",
    "LUGIA",
    "HO-OH",
    "CELEBI",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "?",
    "TREECKO",
    "GROVYLE",
    "SCEPTILE",
    "TORCHIC",
    "COMBUSKEN",
    "BLAZIKEN",
    "MUDKIP",
    "MARSHTOMP",
    "SWAMPERT",
    "POOCHYENA",
    "MIGHTYENA",
    "ZIGZAGOON",
    "LINOONE",
    "WURMPLE",
    "SILCOON",
    "BEAUTIFLY",
    "CASCOON",
    "DUSTOX",
    "LOTAD",
    "LOMBRE",
    "LUDICOLO",
    "SEEDOT",
    "NUZLEAF",
    "SHIFTRY",
    "NINCADA",
    "NINJASK",
    "SHEDINJA",
    "TAILLOW",
    "SWELLOW",
    "ROOMISH",
    "BRELOOM",
    "SPINDA",
    "WINGULL",
    "PELIPPER",
    "SURSKIT",
    "MASQUERAIN",
    "WAILMER",
    "WAILORD",
    "SKITTY",
    "DELCATTY",
    "KECLEON",
    "BALTOY",
    "CLAYDOL",
    "NOSEPASS",
    "TORKOAL",
    "SABLEYE",
    "BARBOACH",
    "WHISCASH",
    "LUVDISC",
    "CORPHISH",
    "CRAWDAUNT",
    "FEEBAS",
    "MILOTIC",
    "CARVANHA",
    "SHARPEDO",
    "TRAPINCH",
    "VIBRAVA",
    "FLYGON",
    "MAKUHITA",
    "HARIYAMA",
    "ELECTRIKE",
    "MANECTRIC",
    "NUMEL",
    "CAMERUPT",
    "SPHEAL",
    "SEALEO",
    "WALREIN",
    "CACNEA",
    "CACTURNE",
    "SNORUNT",
    "GLALIE",
    "LUNATONE",
    "SOLROCK",
    "AZURILL",
    "SPOINK",
    "GRUMPIG",
    "PLUSLE",
    "MINUN",
    "MAWILE",
    "MEDITITE",
    "MEDICHAM",
    "SWABLU",
    "ALTARIA",
    "WYNAUT",
    "DUSKULL",
    "DUSCLOPS",
    "ROSELIA",
    "SLAKOTH",
    "VIGOROTH",
    "SLAKING",
    "GULPIN",
    "SWALOT",
    "TROPIUS",
    "WHISMUR",
    "LOUDRED",
    "EXPLOUD",
    "CLAMPERL",
    "HUNTAIL",
    "GOREBYSS",
    "ABSOL",
    "SHUPPET",
    "BANETTE",
    "SEVIPER",
    "ZANGOOSE",
    "RELICANTH",
    "ARON",
    "LAIRON",
    "AGGRON",
    "CASTFORM",
    "VOLBEAT",
    "ILLUMISE",
    "LILEEP",
    "CRADILY",
    "ANORITH",
    "ARMALDO",
    "RALTS",
    "KIRLIA",
    "GARDEVOIR",
    "BAGON",
    "SHELGON",
    "SALAMENCE",
    "BELDUM",
    "METANG",
    "METAGROSS",
    "REGIROCK",
    "REGICE",
    "REGISTEEL",
    "KYOGRE",
    "GROUDON",
    "RAYQUAZA",
    "LATIAS",
    "LATIOS",
    "JIRACHI",
    "DEOXYS",
    "CHIMECHO"
};

charmap = { [0] =
" ", "À", "Á", "Â", "Ç", "È", "É", "Ê", "Ë", "Ì", "こ", "Î", "Ï", "Ò", "Ó", "Ô",
    "Œ", "Ù", "Ú", "Û", "Ñ", "ß", "à", "á", "ね", "ç", "è", "é", "ê", "ë", "ì", "ま",
    "î", "ï", "ò", "ó", "ô", "œ", "ù", "ú", "û", "ñ", "º", "ª", "�", "&", "+", "あ",
    "ぃ", "ぅ", "ぇ", "ぉ", "v", "=", "ょ", "が", "ぎ", "ぐ", "げ", "ご", "ざ", "じ", "ず", "ぜ",
    "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",
    "っ", "¿", "¡", "P\u{200d}k", "M\u{200d}n", "P\u{200d}o", "K\u{200d}é", "�", "�", "�", "Í", "%", "(", ")",
    "セ", "ソ",
    "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "â", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "í",
    "ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "⬆", "⬇", "⬅", "➡", "ヲ", "ン", "ァ",
    "ィ", "ゥ", "ェ", "ォ", "ャ", "ュ", "ョ", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ",
    "ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ",
    "ッ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?", ".", "-", "・",
    "…", "“", "”", "‘", "’", "♂", "♀", "$", ",", "×", "/", "A", "B", "C", "D", "E",
    "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
    "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
    "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "▶",
    ":", "Ä", "Ö", "Ü", "ä", "ö", "ü", "⬆", "⬇", "⬅", "�", "�", "�", "�", "�", "" }



function stopSocket()
    if not statusSocket then return end
    console:log("Socket Test: Shutting down")
    statusSocket:close()
    statusSocket = nil
end

function socketError(err)
    console:error("Socket Test Error: " .. err)
    stopSocket()
end

function socketReceived()
    while true do
        local p, err = statusSocket:receive(1024)
        if p then
            console:log("Socket Test Received: " .. p:match("^(.-)%s*$"))
        else
            if err ~= socket.ERRORS.AGAIN then
                console:error("Socket Test Error: " .. err)
                stopSocket()
            end
            return
        end
    end
end

function sendMessage(messageType, content)
    if statusSocket then
        statusSocket:send(messageType .. "||" .. content .. "\n")
    end
end

function startSocket()
    console:log("Socket Test: Connecting to 127.0.0.1:8888...")
    statusSocket = socket.tcp()
    statusSocket:add("received", socketReceived)
    statusSocket:add("error", socketError)
    if statusSocket:connect("127.0.0.1", 8888) then
        console:log("Socket Test: Connected")
        lastkeys = nil
    else
        console:log("Socket Test: Failed to connect")
        stopSocket()
    end
end

function RNG(b, m, r)
    b = b or 4
    m = m or 256
    r = r or urand
    local n, s = 0, r:read(b)

    for i = 1, s:len() do
        n = m * n + s:byte(i)
    end

    return n
end

function setupBuffer()
    botBuffer = console:createBuffer("Bot Player")
    cameraBuffer = console:createBuffer("Camera")
    tileMapBuffer = console:createBuffer("Map")
    pathfindBuffer = console:createBuffer("Pathfinder")
    metatileBuffer = console:createBuffer("Metatile")
    debugBuffer = console:createBuffer("Debug")
    debugBuffer:setSize(100, 64)
    tileMapBuffer:setSize(100, 100)
    pathfindBuffer:setSize(100, 100)
    metatileBuffer:setSize(200, 200)
    doMove()
end

lastKey = 0

-- distribution data
-- https://docs.google.com/spreadsheets/d/1F3KdDepPo3Yr4NyIqU6J1_4IVH8qrvaCNZJkFm5yWOk/edit#gid=0
-- UP	105557	10.72%
-- DOWN	92478	9.39%
-- LEFT	76644	7.78%
-- RIGHT	80543	8.18%

-- A	131723	13.37%
-- B	69233	7.03%

-- ANARCHY	59907	6.08%
-- SUBONLY	41928	4.26%

-- START	29759	3.02%
-- SELECT	13778	1.40%

UP_TRIGGER = 22
DOWN_TRIGGER = 40
LEFT_TRIGGER = 56
RIGHT_TRIGGER = 74
A_TRIGGER = 100
B_TRIGGER = 114
START_TRIGGER = 120
SELECT_TRIGGER = 122
L_TRIGGER = 132
R_TRIGGER = 142

table_keys = { "A", "B", "SELECT", "START", "RIGHT", "LEFT", "UP", "DOWN", "R", "L" }

inBattleLoc = 0x3003529
cameraXLoc = 0x0300506C
cameraYLoc = 0x03005068
fieldCameraLoc = 0x03005050

VMapLayoutLoc = 0x03005040
MapWidthLoc = VMapLayoutLoc
MapHeightLoc = VMapLayoutLoc + 4
MapLayoutData = VMapLayoutLoc + 8
SaveBlockLoc = 0x03005008 -- see SaveBlock1 def
LockFieldLoc = 0x03000F9C


isNaive = false
isFollowTarget = true
stuckCount = 0
stuckLimit = 150
zoneFailLimit = 10
zoneFailCount = 0
isSimplePathFollow = false
isMapEventsFollow = true
nextPathElement = {}


map_lookup = {
    "Pallet Town",
    "Viridian City",
    "Pewter City",
    "Cerulean City",
    "Lavender Town",
    "Vermilion City",
    "Celadon City",
    "Fuchsia City",
    "Cinnabar Island",
    "Indigo Plateau",
    "Saffron City",
    "Route 4 Pokémon Center",
    "Route 10 Pokémon Center",
    "Route 1",
    "Route 2",
    "Route 3",
    "Route 4",
    "Route 5",
    "Route 6",
    "Route 7",
    "Route 8",
    "Route 9",
    "Route 10",
    "Route 11",
    "Route 12",
    "Route 13",
    "Route 14",
    "Route 15",
    "Route 16",
    "Route 17",
    "Route 18",
    "Route 19",
    "Route 20",
    "Route 21",
    "Route 22",
    "Route 23",
    "Route 24",
    "Route 25",
    "Viridian Forest",
    "Mt. Moon",
    "S.S. Anne",
    "Underground Path",
    "Underground Path 2",
    "Diglett's Cave",
    "Victory Road",
    "Team Rocket Hideout",
    "Silph Co.",
    "Pokémon Mansion",
    "Safari Zone",
    "Pokémon League",
    "Rock Tunnel",
    "Seafoam Islands",
    "Pokémon Tower",
    "Cerulean Cave",
    "Power Plant"
}

-- get the metatiles for this map and identify which ones are water
-- mark these as collisions to avoid trying to walk over them
-- TODO: detect if got Surf before forcing these to be collision tiles
-- function setWaterCollisions()
--     for x = 0, mapWidth - 1 do
--         for y = 0, mapHeight - 1 do
--             a = 1
--         end
--     end

-- end

---
MapHeaderLoc = 0x02036DFC -- location of gMapHeader MapHeader obj
MapEventsPointerLoc = MapHeaderLoc + 0x04
MapConnectionsPointerLoc = MapHeaderLoc + 0x0C
kantoMapSections = 0x58
function getCurrentLocationName()
    regionMapSecId = emu:read8(MapHeaderLoc + 0x14) - kantoMapSections
    sendMessage("map.name", map_lookup[regionMapSecId + 1])
end

savePointer2Loc = 0x0300500C
function getPlayTime()
    savePointer = emu:read32(savePointer2Loc)
    playHours = emu:read16(savePointer + 0x00E)
    playMins = emu:read8(savePointer + 0x010)
    totalDays = math.floor(playHours / 24)
    totalHours = playHours % 24
    -- debugBuffer:print(string.format("time: %d,%d,%d", totalDays, totalHours, playMins))
    sendMessage('playtime.playtime', string.format("%d,%d,%d", totalDays, totalHours, playMins))
end

function sendMapData(updateType)
    -- updateType == 'layout' or 'position'

    -- we send two map messages:
    -- map.layout: only sent when the map changes, consists of the full data for this map
    -- format:
    -- width | height | tileType[0,0,1...]

    -- tileType can take the following values:
    -- 0: standard, traversable, non-collisions
    -- 1: generic collision
    -- 2: BG object
    -- 3: warp point
    -- 4: north-facing ledge
    -- 5: east-facing ledge
    -- 6: south-facing ledge
    -- 7: west-facing ledge

    -- tileType values are a continuous stream of tile values, left-to-right, top-to-bottom
    -- =========================================
    -- map.position: sent more frequently, with updates on player position and their current target
    -- format:
    -- playerX | playerY | targetX | target Y
    -- TODO: above to be extended with the set of pathfinding steps to be taken
    if (updateType == 'layout') then
        mapMsg = string.format('%d|%d|', mapWidth, mapHeight)
        for x = 0, mapWidth - 1 do
            for y = 0, mapHeight - 1 do
                newMapTileVal = string.format("%d,", map[x][y] and 1 or 0)
                -- debugBuffer:print(string.format("newMapTileVal: %d", map[x][y] and 1 or 0))
                mapMsg = mapMsg .. newMapTileVal
            end
        end
        -- debugBuffer:print(string.format("map update msg: %s", mapMsg))
        sendMessage('map.layout', mapMsg)
    end
end

function getMoney()
    saveBlockPointer = emu:read32(SaveBlockLoc)
    save2Pointer = emu:read32(savePointer2Loc)
    moneyPtr = emu:read32(saveBlockPointer + 0x0290)
    encryptionKey = emu:read32(save2Pointer + 0xF20)
    money = moneyPtr ~ encryptionKey
    -- debugBuffer:print(string.format('money ptr: %d, enc key %x, output money %d', moneyPtr, encryptionKey, money))
    sendMessage('money.money', money)
end

function getTrainerInfo()
    save2Pointer = emu:read32(savePointer2Loc)
    trainerName = emu:readRange(save2Pointer, 8);
    trainerGender = emu:read8(save2Pointer + 0x008);
    decodedTrainerName = ""
    for i = 1, #trainerName do
        nickChar = string.byte(string.sub(trainerName, i, i))
        if nickChar == 0xff then break end
        -- debugBuffer:print(string.format('%x ', nickChar))
        decNickChar = charmap[nickChar]
        decodedTrainerName = decodedTrainerName .. decNickChar
    end
    -- debugBuffer:print(string.format('trainer name: %s, gender %x', decodedTrainerName, trainerGender));
    sendMessage('trainer.trainer', string.format("%s,%x", decodedTrainerName, trainerGender));
end

-- see pokemon.c->GetMonData() and GetBoxMonData() and PokemonSubstruct
function getPartyInfo(partySlot)
    saveBlockPointer = emu:read32(SaveBlockLoc)
    -- partyPokemonLoc = saveBlockPointer + 0x0038 -- at root of first BoxPokemon (0x3005040)
    partyPokemonLoc = 0x02024284
    pokemonStructSize = 0x64
    monMinusBoxStructSize = 0x14
    boxMonStructSize = 0x50

    if not partySlot then partySlot = 0 end

    currentMonPointer = partyPokemonLoc + (100 * partySlot)

    -- get data for decrypting pokemon info
    -- info about this bullshit here: https://bulbapedia.bulbagarden.net/wiki/Pokémon_data_substructures_(Generation_III)
    personality = emu:read32(currentMonPointer)
    otId = emu:read32(currentMonPointer + 4)
    encKey = personality ~ otId
    GAMEorder = personality % 24
    -- testGAMEorder = 1-- MGEA
    local substructSelector = {
        [0] = { 0, 1, 2, 3 },
        [1] = { 0, 1, 3, 2 },
        [2] = { 0, 2, 1, 3 },
        [3] = { 0, 3, 1, 2 },
        [4] = { 0, 2, 3, 1 },
        [5] = { 0, 3, 2, 1 },
        [6] = { 1, 0, 2, 3 },
        [7] = { 1, 0, 3, 2 },
        [8] = { 2, 0, 1, 3 },
        [9] = { 3, 0, 1, 2 },
        [10] = { 2, 0, 3, 1 },
        [11] = { 3, 0, 2, 1 },
        [12] = { 1, 2, 0, 3 },
        [13] = { 1, 3, 0, 2 },
        [14] = { 2, 1, 0, 3 },
        [15] = { 3, 1, 0, 2 },
        [16] = { 2, 3, 0, 1 },
        [17] = { 3, 2, 0, 1 },
        [18] = { 1, 2, 3, 0 },
        [19] = { 1, 3, 2, 0 },
        [20] = { 2, 1, 3, 0 },
        [21] = { 3, 1, 2, 0 },
        [22] = { 2, 3, 1, 0 },
        [23] = { 3, 2, 1, 0 }
    }

    local subOrder = substructSelector[GAMEorder]
    -- debugBuffer:print(string.format("this mon has game order %d, so growth is no. %x", GAMEorder, subOrder[1]))

    rawDataLocation = currentMonPointer + 32 -- 32 bytes before data starts

    -- growthLoc = rawDataLocation -- Growth section is first (each is 12 bytes)
    growthLoc = rawDataLocation + (subOrder[1] * 12)
    -- need to XOR the substruct in 3*4 byte chunks
    decrypted = {}
    chunkPointer = 0
    encryptedChunk = emu:read32(growthLoc + (chunkPointer * 4))
    decryptedChunk = (encryptedChunk ~ encKey)
    -- debugBuffer:print(string.format("decrypted chunk: %x", decryptedChunk))
    -- mankey: d0038
    species = decryptedChunk & 0xFFFF -- get first two bytes for species id

    -- get moves: from Attack substruct
    attackLoc = rawDataLocation + (subOrder[2] * 12)
    decrypted = {}
    moves = {}
    pp = {}

    encryptedChunk = emu:read32(attackLoc)
    decryptedChunk = (encryptedChunk ~ encKey)
    move1 = decryptedChunk & 0x0000FFFF -- get last two bytes for move1
    move2 = (decryptedChunk & 0xFFFF0000) >> 16 -- get first two bytes for move
    -- debugBuffer:print(string.format("got chunk: %x move 1: %d, and move 2: %d \n", decryptedChunk, move1, move2))

    encryptedChunk = emu:read32(attackLoc + 4)
    decryptedChunk = (encryptedChunk ~ encKey)
    move3 = decryptedChunk & 0x0000FFFF
    move4 = (decryptedChunk & 0xFFFF0000) >> 16

    encryptedChunk = emu:read32(attackLoc + 8)
    decryptedChunk = (encryptedChunk ~ encKey)
    pp1 = decryptedChunk & 0x000000FF
    pp2 = (decryptedChunk & 0xFF00) >> 8
    pp3 = (decryptedChunk & 0xFF0000) >> 16
    pp4 = (decryptedChunk & 0xFF000000) >> 24
    -- debugBuffer:print(string.format("got chunk: %x pp 1: %d, pp 2: %d, pp 3: %d, pp 4: %d, \n", decryptedChunk, pp1, pp2
    --     , pp3, pp4))


    nickname = emu:readRange(currentMonPointer + 8, 10)
    decodedNickname = ""
    -- debugBuffer:print(string.format("decoding nickname: "))
    for i = 1, #nickname do
        nickChar = string.byte(string.sub(nickname, i, i))
        if nickChar == 0xff then break end
        -- debugBuffer:print(string.format('%x ', nickChar))
        decNickChar = charmap[nickChar]
        decodedNickname = decodedNickname .. decNickChar
    end
    level = emu:read8(currentMonPointer + boxMonStructSize + 4)
    hp = emu:read16(currentMonPointer + boxMonStructSize + 6)
    maxHp = emu:read16(currentMonPointer + boxMonStructSize + 8)
    sendMessage("party." .. partySlot,
        string.format("%s|%s|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", speciesNames[species + 1], decodedNickname, hp, maxHp,
            level, move1, move2, move3, move4, pp1, pp2, pp3, pp4))



end

-- -- generates a sentence describing the bot's current intention
-- function generateNarrativeForTarget(targetType, offset)
--     if (targetType == "warp") then

--     end
-- end

gotTargetNeedPath = false
needNewEventTarget = false
connectionDirections = { 'south', 'north', 'west', 'east' }
forceRoutableAtTarget = false

function addObjectsToCollisionMap()
    mapEventsPointer = emu:read32(MapEventsPointerLoc)
    objectEventCount = emu:read8(mapEventsPointer)
    objectEventsPointer = emu:read32(mapEventsPointer + 0x04)
    objEventSize = 24
    for objectEventIdx = 0, objectEventCount do
        objectEventOffset = objectEventsPointer + (objEventSize * objectEventIdx)
        objEventX = emu:read8(objectEventOffset + 4) + 7
        objEventY = emu:read8(objectEventOffset + 6) + 7
        pathfindBuffer:moveCursor(objEventX, objEventY)
        pathfindBuffer:print("1")
        map[objEventX][objEventY] = false
        debugBuffer:print(string.format("🧱 Adding object collision %d at %d,%d\n", objectEventIdx,
            objEventX, objEventY))
    end

    freezeForMapTransition = false -- unlock movement now all map data is processed
    sendMapData("layout")



end

function chooseEventToRouteTo()
    -- for the current map
    -- enumerate all the connections, object events, and warp events (see MapEvents)
    -- choose one at random to route to

    -- debug flags for forcing different events to be routed to
    do_first_warp_event = false
    do_first_connection = false
    do_first_obj_event = false

    mapEventsPointer = emu:read32(MapEventsPointerLoc)
    objectEventCount = emu:read8(mapEventsPointer)
    warpCount = emu:read8(mapEventsPointer + 0x01)
    coordEventCount = emu:read8(mapEventsPointer + 0x02)
    bgEventCount = emu:read8(mapEventsPointer + 0x03)
    debugBuffer:print("\n")
    -- debugBuffer:print(string.format("Map object events count: %d\n", objectEventCount))
    -- debugBuffer:print(string.format("Warp count: %d\n", warpCount))
    -- debugBuffer:print(string.format("Coord event count: %d\n", coordEventCount))
    -- debugBuffer:print(string.format("BG event count: %d\n", bgEventCount))

    connectionsPointer = emu:read32(MapConnectionsPointerLoc)
    connectionsCount = emu:read32(connectionsPointer)
    connectionSize = 12
    -- debugBuffer:print(string.format("Connections count: %d\n", connectionsCount))
    if (connectionsCount > 10) then connectionsCount = 0 end

    objectEventsPointer = emu:read32(mapEventsPointer + 0x04)
    -- debugBuffer:print(string.format("First objectEventsPointer %x\n", objectEventsPointer))

    objEventX = emu:read8(objectEventsPointer + 4) + 7
    objEventY = emu:read8(objectEventsPointer + 6) + 7
    objEventSize = 24

    bgEventSize = 12
    bgEventsPointer = emu:read32(mapEventsPointer + 0x10)

    -- debugBuffer:print(string.format("First object event is at %d,%d\n", objEventX, objEventY))

    warpEventsPointer = emu:read32(mapEventsPointer + 0x08)
    -- warpX = emu:read16(warpEventsPointer) + 7
    -- warpY = emu:read16(warpEventsPointer + 2) + 7
    warpEventSize = 8
    -- debugBuffer:print(string.format("First warp event is at %d,%d\n", warpX, warpY))

    coordEventsPointer = emu:read32(mapEventsPointer + 0x0C)
    coordEventSize = 16

    totalEventsCount = objectEventCount + warpCount + connectionsCount + bgEventCount + coordEventCount
    eventIndex = RNG(1) % totalEventsCount

    routableCount = 0
    for _ in pairs(disallowedMapTargets) do routableCount = routableCount + 1 end
    debugBuffer:print(string.format("%d/%d routable targets left on this map\n", totalEventsCount - routableCount,
        totalEventsCount))

    -- debugBuffer:print(string.format("Event %d of %d events\n", eventIndex, totalEventsCount))
    if eventIndex < objectEventCount then
        -- object event
        objectEventIdx = eventIndex
        if (disallowedMapTargets[string.format("obj-%d", objectEventIdx)]) then return end
        objectEventOffset = objectEventsPointer + (objEventSize * objectEventIdx)
        objEventX = emu:read8(objectEventOffset + 4) + 7
        objEventY = emu:read8(objectEventOffset + 6) + 7

        jitterX = (RNG(1) % 5) - 2
        jitterY = (RNG(1) % 5) - 2
        targetX = objEventX + jitterX
        targetY = objEventY + jitterY
        debugBuffer:print(string.format("🙋 >> Routing to object event %d at %d,%d\n", objectEventIdx,
            objEventX, objEventY))
        currentTargetName = string.format("obj-%d", objectEventIdx)
        forceRoutableAtTarget = true
        calculatePathToTarget()
    elseif eventIndex < objectEventCount + warpCount then
        -- warp event
        warpEventIdx = eventIndex - objectEventCount

        -- always allow warps
        -- if (disallowedMapTargets[string.format("warp-%d", warpEventIdx)]) then return end

        warpEventOffset = warpEventsPointer + (warpEventSize * warpEventIdx)
        warpX = emu:read16(warpEventOffset) + 7
        warpY = emu:read16(warpEventOffset + 2) + 7

        -- jitter the target up to one tile in each direction to encourage using door/stair warps
        jitterX = (RNG(1) % 3) - 1
        jitterY = (RNG(1) % 3) - 1
        targetX = warpX + jitterX
        targetY = warpY + jitterY


        -- debugBuffer:print(string.format("Warp pointer at %x\n", warpEventOffset))
        debugBuffer:print(string.format("🚪 >> Routing to warp event %d at %d,%d\n", warpEventIdx, warpX, warpY))
        currentTargetName = string.format("warp-%d", warpEventIdx)

        forceRoutableAtTarget = true
        gotPath = calculatePathToTarget()
    elseif eventIndex < objectEventCount + warpCount + connectionsCount then
        -- connections
        connectionIdx = eventIndex - (objectEventCount + warpCount)

        -- always allow map connections
        -- if (disallowedMapTargets[string.format("connection-%d", connectionIdx)]) then return end


        connectionListPointer = emu:read32(connectionsPointer + 0x04)
        connectionOffset = connectionListPointer + (connectionSize * connectionIdx)
        conxDirection = emu:read8(connectionOffset)
        -- debugBuffer:print(string.format("conxDirection %x with val %x \n", connectionIdx, conxDirection))
        debugBuffer:print(string.format("🗺️ >> Routing to connection %d in direction %s\n", connectionIdx,
            connectionDirections[conxDirection]))
        currentTargetName = string.format("connection-%d", connectionIdx)
        if conxDirection == 1 then
            -- pick a random coordinate on the south-edge without a collision bit
            repeat
                targetX = (RNG(1) % (mapWidth - 14)) + 7
                targetY = mapHeight - (RNG(1) % 7) - 1
            until (map[targetX][targetY] == true)

            calculatePathToTarget()
        end
        if conxDirection == 2 then
            -- pick a random coordinate on the north-edge without a collision bit
            repeat
                targetX = (RNG(1) % (mapWidth - 14)) + 7
                targetY = (RNG(1) % 7)
            until (map[targetX][targetY] == true)
            calculatePathToTarget()
        end
        if conxDirection == 3 then
            -- pick a random coordinate on the west-edge without a collision bit
            repeat
                targetX = (RNG(1) % 7)
                targetY = (RNG(1) % (mapHeight - 14)) + 7
            until (map[targetX][targetY] == true)

            calculatePathToTarget()
        end
        if conxDirection == 4 then
            -- pick a random coordinate on the east-edge without a collision bit
            repeat
                targetX = mapWidth - (RNG(1) % 7) - 1
                targetY = (RNG(1) % (mapHeight - 14)) + 7
            until (map[targetX][targetY] == true)
            calculatePathToTarget()
        end

    elseif eventIndex < objectEventCount + warpCount + connectionsCount + bgEventCount then
        -- BG events
        bgIndex = eventIndex - (objectEventCount + warpCount + connectionsCount)
        bgOffset = bgEventsPointer + (bgEventSize * bgIndex)
        if (disallowedMapTargets[string.format("bg-%d", bgIndex)]) then return end
        -- debugBuffer:print(string.format("root bg pointer %x\n", bgEventsPointer))
        -- debugBuffer:print(string.format("bgOffset %x\n", bgOffset))
        bgX = emu:read16(bgOffset) + 7
        bgY = emu:read16(bgOffset + 0x2) + 7
        jitterX = (RNG(1) % 3) - 1
        jitterY = (RNG(1) % 3) - 1
        targetX = bgX + jitterX
        targetY = bgY + jitterY
        debugBuffer:print(string.format("🪧 >> Routing to BG event %d at %d,%d\n", bgIndex,
            bgX, bgY))
        currentTargetName = string.format("bg-%d", bgIndex)
        forceRoutableAtTarget = true
        calculatePathToTarget()
    elseif eventIndex < objectEventCount + warpCount + connectionsCount + bgEventCount + coordEventCount then
        -- Coord events
        coordIndex = eventIndex - (objectEventCount + warpCount + connectionsCount + bgEventCount)
        coordOffset = coordEventsPointer + (coordEventSize * coordIndex)
        if (disallowedMapTargets[string.format("coord-%d", coordIndex)]) then return end
        -- debugBuffer:print(string.format("coordOffset %x\n", coordOffset))
        coordX = emu:read16(coordOffset) + 7
        coordY = emu:read16(coordOffset + 0x2) + 7
        jitterX = (RNG(1) % 3) - 1
        jitterY = (RNG(1) % 3) - 1
        targetX = coordX + jitterX
        targetY = coordY + jitterY
        debugBuffer:print(string.format("📍 >> Routing to co-ord event %d at %d,%d\n", coordIndex,
            coordX, coordY))
        currentTargetName = string.format("coord-%d", coordIndex)
        calculatePathToTarget()

    end




    if (do_first_warp_event and warpCount > 0) then
        targetX = warpX
        targetY = warpY
        calculatePathToTarget()
    end

    if (do_first_connection and connectionsCount > 0) then
        conxPointer = emu:read8(connectionsPointer + 0x04)
        conxDirection = emu:read8(conxPointer)
        debugBuffer:print(string.format("connectionsPointer loc %x\n", connectionsPointer))
        debugBuffer:print(string.format("First connection direction is %d %s\n", conxDirection,
            connectionDirections[conxDirection]))
        if conxDirection == 1 then
            -- pick a random coordinate on the south-edge without a collision bit
            targetX = RNG(1) % mapWidth
            targetY = mapHeight - 1
            calculatePathToTarget()
        end
        if conxDirection == 2 then
            -- pick a random coordinate on the south-edge without a collision bit
            targetX = RNG(1) % mapWidth
            targetY = 0
            calculatePathToTarget()
        end
        if conxDirection == 3 then
            -- pick a random coordinate on the south-edge without a collision bit
            targetY = RNG(1) % mapHeight
            targetX = 0
            calculatePathToTarget()
        end
        if conxDirection == 4 then
            -- pick a random coordinate on the south-edge without a collision bit
            targetY = RNG(1) % mapHeight
            targetX = mapWidth
            calculatePathToTarget()
        end
    end

    if (do_first_obj_event and objectEventCount > 0) then
        targetX = objEventX
        targetY = objEventY
        calculatePathToTarget()
    end

    if (path) then needNewTarget = false end
end

function doMove()

    -- if not isSimplePathFollow then
    --     emu:clearKeys(0x3FF)
    -- end
    shouldMove = RNG(1)
    if shouldMove < 0xBB then
        return
    end
    emu:clearKeys(0x3FF)
    if isSimplePathFollow then
        emu:clearKeys(0x3FF)
    end
    isInBattle = emu:read8(inBattleLoc)
    lockedFieldControls = emu:read8(LockFieldLoc) -- probably in a menu

    moveWeight = RNG(1)
    mapWidth = emu:read16(MapWidthLoc)
    mapHeight = emu:read16(MapHeightLoc)

    if isNaive then
        emu:clearKeys(0x3FF)

        mapWidth = emu:read16(MapWidthLoc)
        mapHeight = emu:read16(MapHeightLoc)
        nextKey = RNG(1) % 8
        emu:addKey(nextKey)
        botBuffer:print(string.format("Now pressing %s\n", table_keys[nextKey + 1]))
        botBuffer:print(string.format("Camera at %d,%d\n", posX, posY))
        botBuffer:print(string.format("Map size %d x %d\n", mapWidth, mapHeight))
        return
    end

    -- botBuffer:print(string.format("Locked field controls? %s\n", lockedFieldControls))

    -- use pathfinding algo
    if path and nextPathElement and not isSimplePathFollow and isFollowTarget and isInBattle == 0 and
        lockedFieldControls == 0 then
        nextKey = -1
        botBuffer:print(string.format("at %d,%d\n", vPosX, vPosY))
        botBuffer:print(string.format("next step: %s\n", nextPathElement))
        emu:clearKeys(0x3FF)
        possKeys = {}
        if vPosX < nextPathElement.x then
            table.insert(possKeys, 4)
        end
        if vPosX > nextPathElement.x then
            table.insert(possKeys, 5)
        end
        if vPosY < nextPathElement.y then
            table.insert(possKeys, 7)
        end
        if vPosY > nextPathElement.y then
            table.insert(possKeys, 6)
        end
        -- if #possKeys == 0 then
        --     table.insert(possKeys, RNG(1) % 5) -- press a non-directional key when at target
        -- end
        if #possKeys == 0 and vPosX == nextPathElement.x and vPosY == nextPathElement.y then
            stuckCount = 0
            if (#path == 0) then
                debugBuffer:print("✅ Successfully routed to destination! Requesting new path.\n")
                zoneFailCount = zoneFailCount - 1
                needNewTarget = true
            else nextPathElement = table.remove(path, 1) end
            table.insert(possKeys, RNG(1) % 4)
            table.insert(possKeys, 0) -- press A, to try interact with target
            -- nextKey = RNG(1) % 5
        end
        nextKey = possKeys[RNG(1) % #possKeys + 1]
        emu:addKey(nextKey)
        return
    end

    if isSimplePathFollow and isFollowTarget and isInBattle == 0 and lockedFieldControls == 0 then
        possKeys = {}
        emu:clearKeys(0x3FF)
        if vPosX < targetX then
            table.insert(possKeys, 4)
        end
        if vPosX > targetX then
            table.insert(possKeys, 5)
        end
        if vPosY < targetY then
            table.insert(possKeys, 7)
        end
        if vPosY > targetY then
            table.insert(possKeys, 6)
        end
        if #possKeys == 0 then
            table.insert(possKeys, RNG(1) % 5) -- press a non-directional key when at target
        end
        botBuffer:print(string.format("Possible keys: %s\n", #possKeys))
        nextKey = possKeys[RNG(1) % #possKeys + 1]
        emu:addKey(nextKey)
        return
    end


    -- legacy button picker:
    --
    -- -- small chance that we pick an aux button
    -- if(moveWeight < 0x10) then
    --     nextKey = RNG(1) % 4
    --     botBuffer:print(string.format("Now pressing aux key %x\n", nextKey))
    --     lastKey = nextKey
    --     emu:addKey(nextKey)
    --     return
    -- end

    -- -- reasonable chance that we pick a face button
    -- if(moveWeight > 0xD0) then
    --     nextKey = RNG(1) % 2
    --     botBuffer:print(string.format("Now pressing face key %x\n", nextKey))
    --     lastKey = nextKey
    --     emu:addKey(nextKey)
    --     return
    -- end

    -- -- if(nextKey == 2 or nextKey == 8 or nextKey == 9) then
    -- --     return
    -- nextKey = (RNG(1) % 6) + 4

    if moveWeight < UP_TRIGGER then
        nextKey = 6

    elseif moveWeight < DOWN_TRIGGER then
        nextKey = 7
    elseif moveWeight < LEFT_TRIGGER then
        nextKey = 5
    elseif moveWeight < RIGHT_TRIGGER then
        nextKey = 4
    elseif moveWeight < A_TRIGGER then
        nextKey = 0
    elseif moveWeight < B_TRIGGER then
        nextKey = 1
    elseif moveWeight < START_TRIGGER then
        nextKey = 3
    elseif moveWeight < SELECT_TRIGGER then
        nextKey = 2
        -- elseif moveWeight < L_TRIGGER then
        --     nextKey = 8
        -- elseif moveWeight < R_TRIGGER then
        --     nextKey = 9
    else return end

    emu:clearKeys(0x3FF)







    -- if we try to go in the opposite direction to the last key, keep going same direction
    -- only do this if not in battle
    -- if isInBattle == 0 then
    --     if lastMoveKey == 4 and nextKey == 5 then nextKey = 4 end
    --     if lastMoveKey == 5 and nextKey == 4 then nextKey = 5 end
    --     if lastMoveKey == 6 and nextKey == 7 then nextKey = 6 end
    --     if lastMoveKey == 7 and nextKey == 6 then nextKey = 7 end
    --     if nextKey > 3 and nextKey < 8 then lastMoveKey = nextKey end
    -- end


    -- if not in battle and we haven't changed tile since we last pressed a key, ban the last pressed key until our tile changes
    -- if isInBattle == 0 and nextKey == lastMoveKey then
    --     lastX = posX
    --     lastY = posY
    --     posX = emu:read16(cameraXLoc) >> 4
    --     posY = emu:read16(cameraYLoc) >> 4
    --     if isInBattle == 0 and lastX == posX and lastY == posY then
    --         botBuffer:print(string.format("Character stuck, not going %s again\n", table_keys[nextKey+1]))
    --         nextKey = nextKey+1
    --         if nextKey > 7 then nextKey = 4 end
    --         if nextKey > 3 and nextKey < 8 then lastMoveKey = nextKey end
    --     end
    -- end

    posX = (emu:read16(cameraXLoc) >> 4) + 7
    posY = (emu:read16(cameraYLoc) >> 4) + 7

    if freezeForMapTransition then
        botBuffer:print("Locked movement during map transition")
        return
    end

    lastKey = nextKey
    emu:addKey(nextKey)
    -- botBuffer:print(string.format("Now pressing %x after roll %x\n", nextKey, moveWeight))
    botBuffer:print(string.format("Now pressing %s %x\n", table_keys[nextKey + 1], moveWeight))
    -- keys = emu:getKeys()
    -- botBuffer:print(string.format("Current keys %x\n", keys))
    -- botBuffer:print(string.format("Map size %d x %d\n", mapWidth, mapHeight))

end

lastSaveX = 0
lastSaveY = 0
lastMapWidth = 0
lastMapHeight = 0
targetX = -1
targetY = -1
borderSize = 7 -- use a border to create targets outside the playable area to encourage map transitions
vPosX = 0
vPosY = 0
vMapWidth = 0
vMapHeight = 0
collisionMap = {}


map = {}
metatileMap = {}

-- if player gets stuck trying to reach a target, we disallow it being pathed to until the next map transition
disallowedMapTargets = {}
-- unique name for target based on its type and index, eg. connection-2 or bg-4
currentTargetName = nil
-- GetMapGridBlockAt and MapGridGetCollisionAt in fieldmap.c have examples of working with map data
function getMapCollisions()

    collisionMap = {}
    cursorX = 0
    cursorY = 0
    mapSize = (mapWidth * mapHeight) * 2 -- each tile is 2 bytes
    -- debugBuffer:print(string.format("mapSize is %d\n", mapSize))

    -- mapPointer = 0x1FFFFF + emu:read16(MapLayoutData)
    mapPointer = emu:read32(MapLayoutData)
    mapLayPointer = emu:read32(MapHeaderLoc) -- memory location of MapLayout obj
    -- mapHeader = emu:read32(mapLayPointer)
    mapHeader = mapLayPointer
    primaryTilesetPointerLoc = emu:read32(mapHeader + 0x10);
    secondaryTilesetPointerLoc = emu:read32(mapHeader + 0x14);
    primaryTilesetPointer = primaryTilesetPointerLoc
    secondaryTilesetPointer = secondaryTilesetPointerLoc
    -- primaryTilesetPointer = emu:read32(primaryTilesetPointerLoc);
    -- secondaryTilesetPointer = emu:read32(secondaryTilesetPointerLoc);
    primaryMetatileAttribsLoc = emu:read32(primaryTilesetPointer + 0x14);
    secondaryMetatileAttribsLoc = emu:read32(secondaryTilesetPointer + 0x14);
    -- debugBuffer:print(string.format("mapLayPointer %x\n", mapLayPointer));
    -- debugBuffer:print(string.format("map pointer is at %x\n", mapPointer))
    -- debugBuffer:print(string.format("map ends at %x\n", mapPointer+(got)))


    -- // Masks/shifts for blocks in the map grid
    -- // Map grid blocks consist of a 10 bit metatile id, a 2 bit collision value, and a 4 bit elevation value
    -- // This is the data stored in each data/layouts/*/map.bin file
    -- #define MAPGRID_METATILE_ID_MASK 0x03FF // Bits 0-9
    -- #define MAPGRID_COLLISION_MASK   0x0C00 // Bits 10-11
    -- #define MAPGRID_ELEVATION_MASK   0xF000 // Bits 12-15
    -- #define MAPGRID_COLLISION_SHIFT  10
    -- #define MAPGRID_ELEVATION_SHIFT  12

    -- eg. FF03
    -- = 1111111100000011
    -- collision mask = 00
    -- elevation mask = 0011

    -- now read as many bytes as the mapSize is
    -- mapLayout = emu:readRange(mapPointer, mapSize)
    -- debugBuffer:print(string.format("got map layout! %s", mapLayout[0]))






    pathfindBuffer:clear()
    pathfindBuffer:setSize(100, 100)
    map = {}
    metatileMap = {}
    -- debugBuffer:print(string.format("%x",mapLayout))
    for x = 0, mapWidth - 1 do
        map[x] = {}
        metatileMap[x] = {}
        for y = 0, mapHeight - 1 do
            -- tile_id = (x*mapWidth)+(y*mapHeight)
            tile_id = x + mapWidth * y



            -- debugBuffer:print(string.format("looking at tile %x\n", mapPointer+(tile_id*2)))
            mapTile = emu:read16(mapPointer + (tile_id * 2))
            pathfindBuffer:moveCursor(x, y)
            metatileBuffer:moveCursor(x * 2, y * 2)
            -- pathfindBuffer:print("o")

            -- is there collision data here?
            -- debugBuffer:print(string.format("tile: %d,%d, collision shifted: %x, is collision? %x\n",x,y,mapTile>>10,(mapTile & 0x0C00) >> 10))
            mapTileCollision = (mapTile & 0x0C00) >> 10

            -- if this is a ledge, set the permitted direction of travel
            -- so the pathfinder can conditionally determine if it can reach it

            -- identify metatile attributes that prevent traversal - eg. in Mt Moon


            metaTileId = mapTile & 0x03FF;
            if (metaTileId < 640) then
                -- debugBuffer:print("Primary tileset \n")
                metatileAttribsLoc = primaryMetatileAttribsLoc
            else
                -- debugBuffer:print("Secondary tileset \n")
                metatileAttribsLoc = secondaryMetatileAttribsLoc
                metaTileId = metaTileId - 640
            end
            if (metaTileId < 0x03FF) then
                -- debugBuffer:print(string.format("metatileAttribsLoc %x\n", metatileAttribsLoc));

                metaAttrib = emu:read32(metatileAttribsLoc + (metaTileId * 4));
                -- debugBuffer:print(string.format("metatileAttribsLoc offset %x\n", metatileAttribsLoc + (4 * metaTileId)));
                behaviorAttrib = metaAttrib & 0x000001ff >> 0;
                metatileMap[x][y] = behaviorAttrib

                -- metatileBuffer:print(string.format("%x", behaviorAttrib))

            else metatileMap[x][y] = 0
            end

            -- eg. got metaAttrib 1c181c18 tile id 1d for 38,93
            -- behaviourAttribute = 0;
            -- jumpSouthBehaviour = 0x3B;








            -- if the tile is water, we also treat that as collision
            -- look at MetatileAtCoordsIsWaterTile
            -- METATILE_ATTRIBUTE_TERRAIN = 0x00003e00
            -- METATILE_ATTRIBUTE_TERRAIN_SHIFT = 9
            -- TILE_TERRAIN_WATER = 2
            -- MAPGRID_METATILE_ID_MASK = 0x03FF
            -- metaTileId = mapTile & 0x03FF;

            -- debugBuffer:print(string.format("%s",isWater))


            map[x][y] = mapTileCollision == 0
            -- debugBuffer:print(string.format('map entry %s',map[x][y]))
            pathfindBuffer:print(string.format("%x", mapTileCollision))
            table.insert(collisionMap, mapTileCollision)

            -- debugBuffer:print(string.format("%s",mapTile))

            -- pathfindBuffer:print(string.format("%s", mapLayout[(x*mapWidth)+(y*mapHeight)]))
        end
    end
    addObjectsToCollisionMap()

end

path = nil

--lastPathFindPos = nil
pathfindAttemptCount = 0
pathfindLimit = 10000
pathfinderIsOpen = function(currentPathPos, pos)
    pathfindAttemptCount = pathfindAttemptCount + 1
    if pathfindAttemptCount > pathfindLimit then
        debugBuffer:print(string.format("Failing to route in a reasonable time. Forcing to cancel\n"))
        return false
    end
    --return map[pos.x][pos.y]
    -- debugBuffer:print(string.format("pathfinderIsOpen %d %d\n", pos.x, pos.y))
    --currentPathPos = lastPathFindPos
    --if (currentPathPos == nil) then currentPathPos = pos end
    --lastPathFindPos = pos
    if (map[pos.x] == nil or map[pos.x][pos.y] == nil) then return false end
    if (map[pos.x][pos.y] == true) then
        if (metatileMap[pos.x] ~= nil and metatileMap[pos.x][pos.y] ~= nil) then
            -- if this is a water tile, treat as collision
            -- TODO: detect if got Surf
            metatileBehaviour = metatileMap[pos.x][pos.y]
            if (metatileBehaviour >= 0x10 and metatileBehaviour <= 0x17) then
                return false
            end

            -- if this is impassable (eg Mt Moon walls) then treat as collision
            -- see MB_IMPASSABLE_EAST
            if (metatileBehaviour >= 0x30 and metatileBehaviour <= 0x37) then return false
            end

        end
        return true
    end
    if (metatileMap[pos.x] == nil or metatileMap[pos.x][pos.y] == nil) then return false end
    if (map[pos.x][pos.y] == false) then
        metatileBehaviour = metatileMap[pos.x][pos.y]
        if (metatileBehaviour == 0x3B) then -- MB_JUMP_SOUTH
            -- debugBuffer:print(string.format("%s: path find step %d,%d can jump down ledge at %d %d?\n",
            --     pathfindAttemptCount, currentPathPos.x,
            --     currentPathPos.y, pos.x, pos.y))
            return (currentPathPos.y < pos.y) -- if player is above this tile, they can jump down it
        elseif (metatileBehaviour == 0x3A) then -- MB_JUMP_NORTH
            -- debugBuffer:print(string.format("%s: path find step %d,%d can jump up ledge at %d %d?\n",
            --     pathfindAttemptCount, currentPathPos.x,
            --     currentPathPos.y, pos.x, pos.y))
            return (currentPathPos.y > pos.y)
        elseif (metatileBehaviour == 0x38) then -- MB_JUMP_EAST
            -- debugBuffer:print(string.format("%s: path find step %d,%d can jump east ledge at %d %d?\n",
            --     pathfindAttemptCount, currentPathPos.x,
            --     currentPathPos.y, pos.x, pos.y))
            return (currentPathPos.x < pos.x)
        elseif (metatileBehaviour == 0x39) then -- MB_JUMP_WEST
            -- debugBuffer:print(string.format("%s: path find step %d,%d can jump left ledge at %d %d?\n",
            --     pathfindAttemptCount, currentPathPos.x,
            --     currentPathPos.y, pos.x, pos.y))
            return (currentPathPos.x > pos.x)

        end
        return false
    end
end


function calculatePathToTarget()
    pathfindAttemptCount = 0
    -- debugBuffer:print(string.format("got map %s\n", #map))
    if #map == 0 and isMapEventsFollow then
        gotTargetNeedPath = true
        return
    end

    -- update pathfind data to make it possible to route to this tile
    -- eg so player can always walk to a warp point

    if (forceRoutableAtTarget) then
        oldCollisionValue = map[targetX][targetY]
        map[targetX][targetY] = true
    end

    if (savePosX > 200 or savePosY > 200) then
        -- assume we're in the middle of a warp transition and hold off until player has moved
        gotTargetNeedPath = true
        debugBuffer:print(string.format("Pathing has started on a blocked tile, trying again on next frame\n"))
        return
    end

    -- if (map[savePosX + 7][savePosY + 7] == false) then
    --     -- if player is on a collision tile, assume we're in the middle of a warp transition and hold off until player has moved
    --     gotTargetNeedPath = true
    --     debugBuffer:print(string.format("Pathing has started on a blocked tile, trying again on next frame\n"))
    --     return
    -- end

    -- lastPathFindPos = nil
    start = Vector(savePosX + 7, savePosY + 7)
    finish = Vector(targetX, targetY)
    -- path = Luafinding(start, finish, map):GetPath()

    path = Luafinding(start, finish, pathfinderIsOpen):GetPath()
    debugBuffer:print(string.format("starting at %s\n", start))
    debugBuffer:print(string.format("finishing at %s\n", finish))
    -- debugBuffer:print(string.format("path %s\n", i, path))
    if (path == nil) then
        debugBuffer:print(string.format("⛔️ Failed to route path\n"))
        disallowedMapTargets[currentTargetName] = true
        return false
    end

    -- always pop the first step of the path as it causes a lot of backtracking after warps
    table.remove(path, 1)
    -- for i = 1, #path do
    --     debugBuffer:print(string.format("Path step %d: %s\n", i, path[i]))
    -- end
    -- debugBuffer:print(string.format("Pathed after %d metatile tests\n", pathfindAttemptCount))
    getPlayTime()
    nextPathElement = table.remove(path, 1)
    gotTargetNeedPath = false
    if (forceRoutableAtTarget) then map[targetX][targetY] = oldCollisionValue end
    forceRoutableAtTarget = false
    return true




end

freezeForMapTransition = false
function cameraLog()
    -- -- offsets init at 0,0 when loading a new map - they are not absolute positions on the current or global map
    -- posX = (emu:read16(cameraXLoc)) >> 4
    -- posY = (emu:read16(cameraYLoc)) >> 4
    mapWidth = emu:read16(MapWidthLoc)
    mapHeight = emu:read16(MapHeightLoc)

    saveBlockPointer = emu:read32(SaveBlockLoc)
    savePosX = emu:read16(saveBlockPointer);
    savePosY = emu:read16(saveBlockPointer + 2);

    vPosX = savePosX + borderSize
    vPosY = savePosY + borderSize
    vMapWidth = mapWidth + borderSize * 2
    vMapHeight = mapHeight + borderSize * 2
    if lockedFieldControls == 0 and lastSaveX == savePosX and lastSaveY == savePosY then
        stuckCount = stuckCount + 1
        -- else
        --     stuckCount = 0
    end

    if stuckCount > stuckLimit then
        debugBuffer:print(string.format("❌ Stuck trying to reach target %s, requesting new one.\n", currentTargetName))
        disallowedMapTargets[currentTargetName] = true
        needNewTarget = true
        possKeys = {}
        table.insert(possKeys, RNG(1) % 4)
        table.insert(possKeys, 0) -- press A, to try interact with target
        nextKey = possKeys[RNG(1) % #possKeys + 1]
        emu:addKey(nextKey)
        getPartyInfo(0)
        getPartyInfo(1)
        getPartyInfo(2)
        getPartyInfo(3)
        getPartyInfo(4)
        getPartyInfo(5)




        -- else
        --     needNewTarget = false
    end

    -- if stuckCount > stuckLimit then
    --     needNewTarget = true
    -- else
    --     needNewTarget = false
    -- end

    -- if targetX < 0 then
    --     needNewTarget = true
    --     -- getMapCollisions()
    -- end

    if isInBattle > 0 then
        stuckCount = 0
        needNewTarget = false
        if (RNG(1) == 0x0F) then
            getPartyInfo(0)
            getPartyInfo(1)
            getPartyInfo(2)
            getPartyInfo(3)
            getPartyInfo(4)
            getPartyInfo(5)

        end

    end

    -- a target was set before pathfinding map was available on a previous frame
    -- so try again this frame
    if gotTargetNeedPath then calculatePathToTarget() end

    -- todo: IN ROM: heal mon on level up

    -- todo: add some pathfinding that takes into account collision tiles in map
    -- target is a connection or a script object

    if mapWidth ~= lastMapWidth or mapHeight ~= lastMapHeight then
        disallowedMapTargets = {}

        freezeForMapTransition = true -- stop all movement until map data is generated
        emu:clearKeys(0x3FF)

        debugBuffer:print(string.format("🛬 === Map transition! ===\n"))
        gotTargetNeedPath = false
        getCurrentLocationName()
        getMoney()
        getTrainerInfo()


        nextPathElement = nil

        stuckCount = 0
        zoneFailCount = 0
        isSimplePathFollow = false

        getMapCollisions()
        if isMapEventsFollow then
            chooseEventToRouteTo()
        end
        if not isMapEventsFollow then
            targetX = (RNG(2) % (mapWidth))
            targetY = (RNG(2) % (mapHeight))
            gotPath = calculatePathToTarget()
            if not gotPath then needNewTarget = true end
        end
    end
    -- if lastSaveX == targetX and lastSaveY == targetY or needNewTarget then
    --     stuckCount = 0
    --     tileMapBuffer:clear()
    --     targetX = RNG(2) % mapWidth
    --     targetY = RNG(2) % mapHeight
    -- end
    if needNewTarget then
        if stuckCount > stuckLimit then
            zoneFailCount = zoneFailCount + 1
        end
        stuckCount = 0

        -- if zoneFailCount > zoneFailLimit then
        --     isSimplePathFollow = true
        -- end

        -- tileMapBuffer:clear()
        -- targetX = RNG(2) % vMapWidth
        -- targetY = RNG(2) % vMapHeight

        -- if following map events, it will fire new targets itself
        if not isMapEventsFollow then
            targetX = (RNG(2) % (mapWidth))
            targetY = (RNG(2) % (mapHeight))
            gotPath = calculatePathToTarget()
            needNewTarget = not gotPath
        end
        if isMapEventsFollow then chooseEventToRouteTo() end
        -- if not gotPath then needNewTarget = true

    end

    lastMapWidth = mapWidth
    lastMapHeight = mapHeight



    -- this is expensive to update so only do this about once a second
    should_update_map = RNG(1)
    should_update_map = 6
    if should_update_map < 2 then

        if (#collisionMap >= mapWidth * mapHeight) then
            tileMapBuffer:clear()
            tile_inc = 0
            for x = 0, mapWidth - 1 do
                for y = 0, mapHeight - 1 do
                    tile_inc = tile_inc + 1
                    tile_id = x + mapWidth * y
                    tileMapBuffer:moveCursor(x, y)
                    if (x == savePosX + 7 and y == savePosY + 7) then
                        tileMapBuffer:print("o")
                    elseif (x == targetX and y == targetY) then
                        tileMapBuffer:print("?")
                    elseif (collisionMap[tile_inc] == 1) then
                        tileMapBuffer:print("X")
                    else
                        tileMapBuffer:print("_")
                    end
                end
            end
        end
    end
    tileMapBuffer:moveCursor(0, mapHeight)
    tileMapBuffer:print(string.format("stuck count: %d\n", stuckCount))
    tileMapBuffer:print(string.format("zone fail count: %d\n", zoneFailCount))




    -- tileMapBuffer:moveCursor(vPosX, vPosY)
    -- tileMapBuffer:print("x")
    -- tileMapBuffer:moveCursor(targetX, targetY)
    -- tileMapBuffer:print("?")



    lastSaveX = savePosX
    lastSaveY = savePosY

    -- warp format
    -- 8            8       8      16  16
    -- mapgroup / mapid / warpid / x / y
    -- gLastUsedWarp tells you the map you LEFT
    -- sWarpDestination tells you where you arrived
    -- use data/maps/map_groups.json to map these


    cameraBuffer:clear()
    -- cameraBuffer:print(string.format("Camera at %d,%d\n", posX, posY))
    cameraBuffer:print(string.format("need collision map of %d, got %d\n", mapWidth * mapHeight, #collisionMap))
    cameraBuffer:print(string.format("Save camera at %d,%d\n", savePosX, savePosY))
    cameraBuffer:print(string.format("Map size %d x %d\n", mapWidth, mapHeight))
end

callbacks:add("start", setupBuffer)
callbacks:add("start", startSocket)
callbacks:add("frame", doMove)
callbacks:add("frame", cameraLog)
if emu then
    setupBuffer()
    startSocket()
end