# Created by Isaac Netti github.com/isaacnetti
$name = "John Doe"
$level = 1
$spell_list = @("Flame hand","Healing Word")
$hp = 5
$ehp = 4
$round = 0
$echo = "false"

function Cast-spell ($spellnum) {

    if ($spell_list[$spellnum-1] -eq "Flame hand") {
        $script:ehp -= $level+1
        Write-Host "You burned the enemy for $($level+1) damage!" -ForegroundColor Green
    }
    elseif ($spell_list[$spellnum-1] -eq "Healing Word") {
        $script:hp += $level+1
        Write-Host "You healed for $($level+1) HP!" -ForegroundColor Green
    }
    elseif ($spell_list[$spellnum-1] -eq "Necromancy") {
        $script:hp += $level
        $script:ehp -= $level
        Write-Host "You stole $($level) HP from the enemy!" -ForegroundColor Green
    }
    else {
        Write-Host "Invalid input $name, lose a turn" -ForegroundColor Red
    }
}

function Add-spell($spellname){
        $script:spell_list += $spellname
        Write-Host "You learned $spellname!"
}

Write-Host "Welcome weary traveler, you have just become a wizard named $name"
$uinput = Read-Host -Prompt "Would you like to change your name? y/n"

if ($uinput -eq "y"){
    $name = Read-Host -Prompt "Enter your magical new name"
    Write-Host "Nice to meet you $name" -ForegroundColor Blue
}
elseif ($uinput -eq "n") {
    Write-Host "Good choice $name" -ForegroundColor Red
}
else {
    Write-Host "Please enter either y or n next time $name" -ForegroundColor Red
}

Write-Host "You heard legends of a book, one of ancient magical knowledge. You followed rumors and gossip until it led you here. A dark cave at the edge of a frigid forest,"
$uinput = Read-Host -Prompt "You hear growling inside, would you like to enter? y/n"

if ($uinput -eq "y"){
    Write-Host "I knew you were the one I was waiting for $name" -ForegroundColor Magenta
}
elseif ($uinput -eq "n") {
    Write-Host "COWARD! I HATE YOU! START AGAIN! DO IT BETTER OR I WIL-" -ForegroundColor Red
    exit
}
else {
    Write-Host "I dont mind chosing for you $name, you go in" -ForegroundColor Red
}
pause

Write-Host "As you step into the cave, the growling gets lowder until eventualy you see the glowing red eyes. An angry wolf lashes out at you!"
Write-Host "He bites your arm"


while ($script:hp -cge 1) {
 $round += 1

 Write-Host "You have $script:hp hp remaining, you know the spells: $($spell_list -join ", ")"
 
 for ($i = 0; $i -lt $spell_list.Count; $i++) {
    Write-Host "To cast $($spell_list[$i]) type $($i+1)"
 }
 
 $uinput = Read-Host
 Cast-spell($uinput)

 if($script:ehp -cle 0){
    Write-Host "You've taken down the wolf!"
    break
 }

 Write-Host "The Wolf is angry, he bites you for $round damage"
 $script:hp -= $round
 pause
}

if($hp -cle 0){
    Write-Host "Oh $name, You died. For nothing. How disapointing" -ForegroundColor Red
    Write-Host "GAME OVER"
    exit
}
$round = 0
$level += 1
$hp += 3

Write-Host "Your encounter with the wolf left you hurt but wiser, you leveled up! You heal more,deal more damage and now have $hp hp"
pause
Write-Host  "You finally take in your surroundings, but they feel..."
Write-Host "Wrong" -ForegroundColor Red
Write-Host "You are in a bedroom, with a single door. In the middle of the room is a podium with a book titled"
Write-Host "Learn a new spell" -ForegroundColor Blue
$uinput = Read-Host -Prompt "Do you pick it up? y/n"

if ($uinput -eq "y"){
    $hp -= 2
    Write-Host "Good $name, free me, save us" -ForegroundColor Red
    Write-Host "It burns into your brain, knowledge imparted. You take 2 damage."
    Write-Host "Current hp: $hp"
    Add-spell("Necromancy")
}
elseif ($uinput -eq "n") {
    Write-Host "You can resist his power? Listen to me, you must escape while you still can. Don't fight hi-" -ForegroundColor Blue
}
else {
    $hp -= 2
    Write-Host "Following the rules is optional $name, you are only a vessel" -ForegroundColor Red
    Write-Host "It burns into your brain, knowledge imparted. You take 2 damage. Current hp: $hp"
    Add-spell("Necromancy")
}
pause


Write-Host "Well only one place to go, you open the door to the bedroom. Voices poor in"
Write-Host "Can I become you?" -ForegroundColor Yellow
Write-Host "Give in" -ForegroundColor Red
Write-Host "m only heal" -ForegroundColor Blue
Write-Host "I beleive in you" -ForegroundColor Magenta
Write-Host "It's hopeless" -ForegroundColor DarkCyan
Write-Host "FIGHT" -ForegroundColor Black -BackgroundColor Red
Pause

Write-Host "You open your eyes, it is quiet once more. You feel the frigid air from the forest, you see the walls of the cave. You are back"
Pause

Write-Host "You head deeper in the cave, but your footsteps echo one to many times"
$uinput = Read-Host -Prompt "Do you turn around? y/n"
if ($uinput -eq "y"){
    $ehp = 8
    $echo = "true"
    Write-Host "Oh, hello" -ForegroundColor Yellow
    Write-Host "You stare back at yourself,but with no face."
    Write-Host "One of us must lose" -ForegroundColor Yellow
}
elseif ($uinput -eq "n") {
    Write-Host "Oh no, you may not be strong enough now" -ForegroundColor Blue
    Write-Host "You feel a chill creep down your spine and press forward"
}
else {
    $ehp = 8
    $echo = "true"
    Write-Host "Why must you make me do this" -ForegroundColor Red
    Write-Host "You turn around and stare back at yourself,but with no face."
    Write-Host "One of us must lose" -ForegroundColor Yellow
    Write-Host "It says before lunging at you"
}
pause

if ($echo -eq "true") {
    while ($script:hp -cge 1) {
        $round += 1

        Write-Host "You have $script:hp hp remaining, you know the spells: $($spell_list -join ", ")"
        
        for ($i = 0; $i -lt $spell_list.Count; $i++) {
            Write-Host "To cast $($spell_list[$i]) type $($i+1)"
        }
        
        $uinput = Read-Host
        Cast-spell($uinput)

        if($script:ehp -cle 0){
            Write-Host "You've taken down the Echo!"
            break
        }

        Write-Host "The Echo wants more, he claws at you for $($round+1) damage"
        $script:hp -= $round+1

        if($hp -cle 0){
             Write-Host "You dont mind if I borrow this skin do you?" -ForegroundColor Yellow
             Write-Host "GAME OVER"
            exit
        }
        pause       
    }
}

if($echo -eq "true"){
    $round = 0
    $level += 1
    $hp += 3
    Write-Host "Your encounter with the Echo left you hurt but wiser, you leveled up! You heal more,deal more damage and now have $hp hp"
    pause
}

Write-Host "The Cave ends abruptly at a set of massive double doors"
$uinput = Read-Host -Prompt "Do you go in? y/n"
if ($uinput -eq "y"){
    Write-Host "You've finally made it to me" -ForegroundColor Red
}
elseif ($uinput -eq "n") {
    Write-Host "Sorry, you can't turn back now" -ForegroundColor Blue
    Write-Host "You must use necromancy to truly beat him" -ForegroundColor Blue
}
else {
    Write-Host "Don't misbehave now, we are so close" -ForegroundColor Red
}
pause

Write-Host "A skeleton sits in the middle of the room with a scythe across his lap"
Write-Host "When he sees you, he rises"
Write-Host "Do you mind if I test your strength $name?" -ForegroundColor Red
$ehp = 12
Pause

while ($script:hp -cge 1) {
        $round += 1

        Write-Host "You have $script:hp hp remaining, you know the spells: $($spell_list -join ", ")"
        
        for ($i = 0; $i -lt $spell_list.Count; $i++) {
            Write-Host "To cast $($spell_list[$i]) type $($i+1)"
        }
        
        $uinput = Read-Host
        Cast-spell($uinput)

        if($script:ehp -cle 0){
            Write-Host "You've taken down the Skeleton!"
            break
        }
        if($script:ehp -eq 12 -and $round -eq 5){
            Write-Host "WHY WONT YOU FIGHT ME" -ForegroundColor Red
            Write-Host "The Skeleton's scythe clatters to the ground, his bones cannot seem to hold themselves together anymore"
            break
        }
        Write-Host "The Skeleton feasts on your soul, his scythe digs into you for $($round+3) damage"
        $script:hp -= $round+3

        if($hp -cle 0){
             Write-Host "INSOLENT FOOL HAHAHAHAHAHAHHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHAHHAHAHA" -ForegroundColor Red
             Write-Host "GAME OVER"
            exit
        }
        pause       
    }

if($script:ehp -eq 12){
    Write-Host "Cast the spell QUICK" -ForegroundColor Blue
    Add-spell("Escape")
    $uinput = Read-Host -Prompt "Cast it? y/n"
    if ($uinput -eq "y"){
        Write-Host "You appear back at the entrance to the cave, you are holding a book. It's title reads"
        Write-Host "Learn New Spells, a ghosts guide to power (cursed to those unworthy)" -ForegroundColor Cyan
        Write-Host "Use it for good $name, make our world a better place, never come back here" -ForegroundColor Blue
        Write-Host "YOU WIN" -ForegroundColor Green
    }
    elseif ($uinput -eq "n") {
        Write-Host "HAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHAHAHAHAHAHAHAHAHHAHAHAHAHAHAHAHA" -ForegroundColor Red
        Write-Host "Welcome to your eternety fool, hopefully the next adventurer is as dumb as you" -ForegroundColor Red
        Write-Host "You join the skeleton on the floor as the doors slam shut, you are stuck... until someone casts the spell for you"
        Write-Host "You lose" -ForegroundColor Red
    }
    else {
        Write-Host "I SAID Y/N ARE YOU LOST?" -ForegroundColor Magenta
        Write-Host "You Lose because I said so"
        Write-Host "Game Over"
    }
    pause
    exit
}
Write-Host "The Skeletons head clatters to the ground,defeated... right?"
pause
Write-Host "HAHAHAHAHAHAHAHAHHAHAHAH you are mine now" -ForegroundColor Red
Add-spell("Escape")
Read-Host -Prompt "Cast it? y/n"
Write-Host "Input overwritten, casting"
pause
Write-Host "HAHAHAHAHAHHHAHAHAHAHAHHAHA FINALLY" -ForegroundColor Red
pause
Write-Host "You are left alone in a room, staring at a set of large doors, a scythe lays across your lap"
Write-Host "Your bones ache"
Write-Host "You win?"
pause
