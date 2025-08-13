using { /Fortnite.com/UI }
using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }

# Tycoon Game UI System
# Handles all user interface elements for the tycoon game

# UI Device References
var MainHUD : HUDDevice = HUDDevice{}
var ResourcePanel : HUDDevice = HUDDevice{}
var UpgradePanel : HUDDevice = HUDDevice{}
var GameStatusPanel : HUDDevice = HUDDevice{}
var NotificationPanel : HUDDevice = HUDDevice{}

# UI State Variables
var IsUpgradeMenuOpen : logic = false
var CurrentResourceDisplay : string = ""
var CurrentLevelDisplay : string = ""
var CurrentExperienceDisplay : string = ""

# UI Configuration
var UIUpdateInterval : float = 0.5
var NotificationDuration : float = 3.0

# Initialize UI System
OnBegin<HUDDevice>() : void =
    SetupMainHUD()
    SetupResourcePanel()
    SetupUpgradePanel()
    SetupGameStatusPanel()
    SetupNotificationPanel()
    
    # Start UI update loop
    Spawn[UIUpdateLoop()]

# Setup Main HUD
SetupMainHUD() : void =
    MainHUD.SetText("🎮 TYCOON EMPIRE 🎮")
    MainHUD.SetText("Build your empire from scratch!")

# Setup Resource Panel
SetupResourcePanel() : void =
    ResourcePanel.SetText("💰 RESOURCES 💰")
    ResourcePanel.SetText("Gold: 0")
    ResourcePanel.SetText("Level: 1")
    ResourcePanel.SetText("XP: 0/100")

# Setup Upgrade Panel
SetupUpgradePanel() : void =
    UpgradePanel.SetText("⚡ UPGRADES ⚡")
    UpgradePanel.SetText("Click to upgrade!")
    UpgradePanel.SetText("Cost: 100 Gold")

# Setup Game Status Panel
SetupGameStatusPanel() : void =
    GameStatusPanel.SetText("📊 GAME STATUS 📊")
    GameStatusPanel.SetText("Wave: 1")
    GameStatusPanel.SetText("Time: 00:00")

# Setup Notification Panel
SetupNotificationPanel() : void =
    NotificationPanel.SetText("")
    NotificationPanel.SetText("")
    NotificationPanel.SetText("")

# UI Update Loop
UIUpdateLoop() : void =
    loop:
        Sleep(UIUpdateInterval)
        UpdateResourceDisplay()
        UpdateGameStatus()

# Update Resource Display
UpdateResourceDisplay() : void =
    # This would be called with actual player data
    # For now, showing placeholder values
    ResourcePanel.SetText("💰 RESOURCES 💰")
    ResourcePanel.SetText("Gold: " + CurrentResourceDisplay)
    ResourcePanel.SetText("Level: " + CurrentLevelDisplay)
    ResourcePanel.SetText("XP: " + CurrentExperienceDisplay)

# Update Game Status
UpdateGameStatus() : void =
    var gameTime : float = GetGameTime()
    var minutes : int = (gameTime / 60).Floor()
    var seconds : int = (gameTime % 60).Floor()
    
    GameStatusPanel.SetText("📊 GAME STATUS 📊")
    GameStatusPanel.SetText("Wave: 1")
    GameStatusPanel.SetText("Time: " + minutes.ToString() + ":" + seconds.ToString().PadStart(2, "0"))

# Show Notification
ShowNotification(message : string) : void =
    NotificationPanel.SetText("🔔 " + message)
    
    # Clear notification after duration
    Spawn[ClearNotificationAfterDelay()]

# Clear Notification After Delay
ClearNotificationAfterDelay() : void =
    Sleep(NotificationDuration)
    NotificationPanel.SetText("")

# Update Resource Values (called from main game logic)
UpdateResourceValues(resources : int, level : int, experience : int, experienceToNext : int) : void =
    CurrentResourceDisplay = resources.ToString()
    CurrentLevelDisplay = level.ToString()
    CurrentExperienceDisplay = experience.ToString() + "/" + experienceToNext.ToString()

# Toggle Upgrade Menu
ToggleUpgradeMenu() : void =
    IsUpgradeMenuOpen = !IsUpgradeMenuOpen
    
    if (IsUpgradeMenuOpen) then
        UpgradePanel.SetText("⚡ UPGRADES ⚡")
        UpgradePanel.SetText("Click to upgrade!")
        UpgradePanel.SetText("Cost: 100 Gold")
        UpgradePanel.SetText("Press E to close")
    else
        UpgradePanel.SetText("⚡ UPGRADES ⚡")
        UpgradePanel.SetText("Press E to open")

# Show Level Up Notification
ShowLevelUpNotification(newLevel : int) : void =
    ShowNotification("🎉 LEVEL UP! You are now level " + newLevel.ToString() + "! 🎉")

# Show Resource Collection Notification
ShowResourceCollectionNotification(amount : int) : void =
    ShowNotification("💎 Collected " + amount.ToString() + " gold!")

# Show Upgrade Notification
ShowUpgradeNotification(upgradeType : string) : void =
    ShowNotification("⚡ Upgraded " + upgradeType + "!")

# Show Insufficient Resources Notification
ShowInsufficientResourcesNotification() : void =
    ShowNotification("❌ Not enough resources for this upgrade!")

# Show Game Start Notification
ShowGameStartNotification() : void =
    ShowNotification("🚀 Welcome to Tycoon Empire! Start building your fortune!")

# Show Game Over Notification
ShowGameOverNotification(finalScore : int) : void =
    ShowNotification("🏁 Game Over! Final Score: " + finalScore.ToString() + " gold!")

# Update Upgrade Panel with Current Costs
UpdateUpgradePanel(currentLevel : int, baseCost : int) : void =
    var upgradeCost : int = baseCost * currentLevel
    UpgradePanel.SetText("⚡ UPGRADES ⚡")
    UpgradePanel.SetText("Current Level: " + currentLevel.ToString())
    UpgradePanel.SetText("Upgrade Cost: " + upgradeCost.ToString() + " Gold")
    UpgradePanel.SetText("Press E to upgrade")

# Show Achievement Notification
ShowAchievementNotification(achievementName : string) : void =
    ShowNotification("🏆 ACHIEVEMENT UNLOCKED: " + achievementName + "! 🏆")

# Show Welcome Message
ShowWelcomeMessage() : void =
    ShowNotification("👋 Welcome to Tycoon Empire! Click on resource collectors to earn gold!")

# Show Help Message
ShowHelpMessage() : void =
    ShowNotification("❓ Press H for help, E to interact with upgrades, and click to collect resources!")