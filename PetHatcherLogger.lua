print("[PetHatcherLogger] Loaded!")
repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer

getgenv().PetHatcher = {
    Webhook = "https://discord.com/api/webhooks/1396865077914898534/Xpx1vHjfT0YG5pjwwUQ2Xnexl4GuHk2yOk83jwCw9J03c8EdKTf0hy2Gdh_-znuDrf7K", -- Replace with your webhook
    Ping = "", -- "@everyone" or leave blank
    Rarities = {"Legendary", "Secret", "Shiny", "Mythic", "Shiny Mythic"},
    MinChance = 900000,
    CountPets = true,
    PetNameFilter = {"1M", "2M"},
}

local HatchedPetsCount = {}
local TotalEggsHatched = 0

local function sendWebhook(petName, petRarity, petChance)
    TotalEggsHatched = TotalEggsHatched + 1
    HatchedPetsCount[petName] = (HatchedPetsCount[petName] or 0) + 1

    local embed = {
        title = "Bubble Gum Simulator ∞",
        description = string.format(
            "**Name:** %s\n\nHatched a **%s**\n- Rarity: %s (Chance: 1 in %s)\n- Total Eggs: %d\n- Total Hatched: %d",
            localPlayer.Name,
            petName,
            petRarity,
            tostring(petChance),
            TotalEggsHatched,
            HatchedPetsCount[petName]
        ),
        color = 0x00ffcc,
        footer = { text = "BGSI Logger by LETSTEAMYT" }
    }

    local data = {
