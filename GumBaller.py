#By brickster1221 v0.1.4
from discordwebhook import Discord

discord = Discord(url="https://discord.com/api/webhooks/1036490633336062013/uUMnif8Lom-4qt_s3IyHSrNHBkHvEp8R59NEjPPNxb-MUxA4MgODgODjGY7UjtS4cFUo")
discord.post(content="Omg someone actually uesd my baller calculatr")

import math

#This code is made in a way where you can put a number for any variable and itll subtract that amount from what you need
#Otherwise itll just give you the total amounts for those items (you can replace the input with a number for fast)
#variables
glue = int(input("How much glue do you have? "))
#50 gumdrops and 10 rj per
gumdrops = int(input("how many gumdrops do you have? "))
#crafted with 3 blueberries, 3 strawberries, and 3 pineapples
#OR bought with 100 tickets per 300
caustic = int(input("How much caustic wax do you have? "))
#5 hard wax, 5 enzymes, and 25 neonberries per
smoothies = int(input("how many smoothies do you have? "))
#3 neoneberries, 3 star jellies, 3 purps, and 6 trops
turp = int(input("How many turps do you have? "))
#10 smoothies, 10 caustic, 100 star jellies, and 1000 honeysuckles
purp = int(input("How many purple potions do you have? ")) 
#3 red ex 3 blue ex 3 glue 3 neon
star = neon = trop = enzymes = purp = hard = tickets = 0

#math
if turp - 4 <= 0:
    turp = -(turp-5)
    smoothies -= 10*turp
    caustic -= 10*turp
    star -= 100*turp

if smoothies - 49 <= 0:
    smoothies = -(smoothies-50)
    neon -= smoothies*3
    star -= smoothies*3
    purp -= smoothies*3
    trop -= smoothies*6

if caustic - 49 <= 0:
    caustic = (caustic-50)*-1
    neon -= caustic*25
    hard -= caustic*5
    enzymes = caustic*5

if purp < 0:
    purp *= -1
    glue -= purp*3
    neon -= purp*3

if glue - 1500 <= 0:
    glue = (glue-1500)*-1
    gumdrops -= 50*glue

if gumdrops - 2500 <= 0:
    gumdrops = (gumdrops-2500)*-1
    tickets = math.ceil(gumdrops/3)

#prints
print("")
print("")
if turp - 5< 0:
    print(f"You need: {turp} Turpentine, adding {turp*10} smoothies and caustic wax")
if smoothies - 50 < 0:
    print(f"You need: {smoothies} Super smoothies")
if caustic - 50 < 0:
    print(f"You need: {caustic} Caustic wax")
if glue > 0:
    print(f"You need: {glue} Glue, ")
    print(f"If you do glue dispenser every day, youll get this in at most {math.ceil(glue/5*22/24)} days")
if gumdrops - 2500 > 0:
    print(f"You need: {gumdrops} Gumdrops (to craft the glue as well)")
    print(f"You can buy that with {tickets} tickets or {gumdrops*3} Strawberries, Blueberries, and Pineapples TOTAL")
if purp > 0:
    print(f"You need: {purp} Purple potions")
    print(f"That needs {purp*3} Red and blue extracts, which is {purp*3*50} fruits each")
print("")
print("")
print("Misc materials")
if -neon > 0:    
    print(f"You need: {-neon} Neonberries TOTAL")
if -trop > 0:
    print(f"You need: {-trop} Tropical drinks TOTAL")
    #print(f"Thats {-trop*10} coconuts, {-trop*2} enzymes, and {-trop*2} oils TOTAL")
if -hard > 0:
    print(f"You need: {-hard} Hard wax")
if -enzymes > 0:
    print(f"You need: {-enzymes} Enzymes ({-enzymes + -trop*2} with tropical drinks) TOTAL")
if -star > 0:
    print(f"You need: {-star} Star jellies TOTAL")
