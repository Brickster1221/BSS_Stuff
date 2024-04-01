#By brickster1221 v0.2


#from discordwebhook import Discord
#discord = Discord(url="https://discord.com/api/webhooks/1036490633336062013/uUMnif8Lom-4qt_s3IyHSrNHBkHvEp8R59NEjPPNxb-MUxA4MgODgODjGY7UjtS4cFUo")
#discord.post(content="Omg someone actually uesd my baller calculatr")

import configparser
import math
config = configparser.ConfigParser()
config.read('Inventory.ini')

turp = -int(config['Inventory']['Turpentine'])
#10 smoothies, 10 caustic, 100 star jellies, and 1000 honeysuckles
smoothies = -int(config['Inventory']['Super-Smoothie'])
#3 neoneberries, 3 star jellies, 3 purps, and 6 trops
caustic = -int(config['Inventory']['Caustic-Wax'])
#5 hard wax, 5 enzymes, and 25 neonberries per
swirled = -int(config['Inventory']['Swirled-Wax'])
#3 hard wax, 9 soft wax, 6 purps, 3333 rj
glue = -int(config['Inventory']['Glue'])
#50 gumdrops and 10 rj per
purp = -int(config['Inventory']['Purple-Potion'])
#3 red ex 3 blue ex 3 glue 3 neon

#LOW TIER MATS (skull)
star = -int(config['Inventory']['Star-Jelly'])
neon = -int(config['Inventory']['Neonberry'])
hard = -int(config['Inventory']['Hard-Wax'])
soft = -int(config['Inventory']['Soft-Wax'])
royal = -int(config['Inventory']['Royal-Jelly'])
honeysuckles = -int(config['Inventory']['Honeysuckle'])
enzymes = -int(config['Inventory']['Enzymes'])
trop = -int(config['Inventory']['Tropical-Drink'])
Rextract = -int(config['Inventory']['Red-Extract'])
Bextract = -int(config['Inventory']['Blue-Extract'])
gumdrops = -int(config['Inventory']['Gumdrops'])
straw = -int(config['Inventory']['Strawberry'])
blueb = -int(config['Inventory']['Blueberry'])

#MATH TIME!!!

if 0 < turp + 5:
    turp += 5
    smoothies += 10*turp
    caustic += 10*turp
    star += 100*turp
    honeysuckles += 1000*turp

if 0 < caustic + 50:
    caustic += 50
    hard += caustic*5
    enzymes += caustic*5
    neon += caustic*25


if 0 < smoothies + 50:
    smoothies += 50
    neon += smoothies*3
    star += smoothies*3
    purp += smoothies*3
    trop += smoothies*6

if 0 < glue + 1500:
    glue += 1500

if 0 <= purp:
    Rextract += purp*3
    Bextract += purp*3
    glue += purp*3

if 0 <= glue:
    gumdrops += glue*50
    royal += glue*10

if 0 <= Rextract:
    straw += Rextract*50
    royal += Rextract*10

if 0 <= Bextract:
    blueb += Bextract*50
    royal += Bextract*10

#prints
print("")
print("")
print("")
#major prints
if turp > 0:
    print(f"You need {turp} Turp, adding {turp*10} smoothies and caustic")
if caustic > 0:
    print(f"You need {caustic} Caustic wax")
if swirled > 0:
    print(f"You need {swirled} Swirled wax")
if smoothies > 0:
    print(f"You need {smoothies} Super Smoothies")
print("")
#info prints
if purp > 0:
    print(f"You need {purp} Purple potions")
    print(f"This adds {purp*3} blue and red extracts")
    print("")

if glue > 0:
    print(f"You need {glue} Glue, needing {gumdrops} more gumdrops")
    print(f"If you do glue dispenser every day, youll get this in at most {math.ceil(glue/5*22/24)} days")
    tickets = math.ceil((glue*50)/3)
    print(f"You can buy that with {tickets} tickets or {gumdrops*3} Strawberries, Blueberries, and Pineapples TOTAL")
    print("")

if Rextract > 0:
    print(f"You need {Rextract} Red Extracts, Costing {straw} Strawberries")

if Bextract > 0:
    print(f"You need {Bextract} Blue Extracts, Costing {blueb} Blueberries")

print("")
print("")

print("Extra mats")
if neon > 0:
    print(f"You need {neon} neonberries ")
if star > 0:
    print(f"You need {star} star jellies")
if hard > 0:
    print(f"You need {hard} Hard wax, needing {hard*3} enzymes and soft wax, {hard*33} Bitter (just for hard wax)")
if soft > 0:
    print(f"You need {soft} Soft wax, needing {soft*5} honeysuckles, {soft} oil and enzymes, and {soft*10} rj (just for soft wax)")
if royal > 0:
    print(f"You need {royal} royal jelly")
if honeysuckles > 0:
    print(f"You need {honeysuckles} Honeysuckles for turp")
if enzymes > 0:
    print(f"You need {enzymes} Enzymes")
if trop > 0:
    print(f"You need {trop} Tropical drinks")
