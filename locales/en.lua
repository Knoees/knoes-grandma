local Translations = {
    grandma = {
        helping = 'Grandma helping you',
        youfailed = 'You failed',
        cancel = 'Cancelled',
        targetlabel = 'Grandma',
        nomoney = 'You dont have enough money'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
