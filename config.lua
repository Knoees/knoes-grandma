Config = {}

Config.HelpDuration = 5000 -- progressbar duration
Config.Minigame = true  --- true and false

Config.ReviveConfig = {
    PaymentType = 'cash', -- cash and bank
    PaymentPrice = 1000, 
}


Config.Grandmas = {
    [1] = {
        Ped = {
            Model = "cs_mrs_thornhill",
            Coord = vector3(1537.28, 1702.4, 109.67),
            Heading = 84.15,
            TargetLabel = Lang:t("grandma.targetlabel"),
            TargetIcon = "fas fa-user-injured",
            Scenarios = false,
            Scenario = "",
            AnimDict = '',
            AnimName = '',
            AnimFlag = 0,
        },
        Blip = {
            Show = true,
            Label = 'Grandma',
            Colour = 5,
            Sprite = 310,
            Scale = 0.6,
        }
    },
    [2] = {
        Ped = {
            Model = "cs_mrs_thornhill",
            Coord = vector3(575.81, 2790.63, 42.19),
            Heading = 5.9,
            TargetLabel = Lang:t("grandma.targetlabel"),
            TargetIcon = "fas fa-user-injured",
            Scenarios = false,
            Scenario = "",
            AnimDict = '',
            AnimName = '',
            AnimFlag = 0,
        },
        Blip = {
            Show = true,
            Label = 'Grandma',
            Colour = 5,
            Sprite = 310,
            Scale = 0.6,
        }
    },
}