#made by brickster1221 V0.1
import configparser
import math
config = configparser.ConfigParser()
config.read('Inventory.ini')

#Updates Values
Mode = False #input("Would you like to update your inventory Y/N ")
if Mode == "Y":
    config['Inventory']['Glue'] = input("Glue: ")
    config['Inventory']['Enzymes'] = input("Enzymes: ")
    config['Inventory']['Oil'] = input("Oil: ")
    config['Inventory']['Glitter'] = input("Glitter: ")
    print("You can update more in 'Inventory.ini'")

glue = -int(config['Inventory']['Glue'])
#50 gumdrops and 10 rj
enzymes = -int(config['Inventory']['Enzymes'])
#50 pineapples and 10 rj
oil = -int(config['Inventory']['Oil'])
#50 sunf seeds and 10 rj
glitter = -int(config['Inventory']['Glitter'])
#25 moon charms and 1 bean

#LOW TIER MATS (skull)
gumdrops = -int(config['Inventory']['Gumdrops'])
pineap = -int(config['Inventory']['Pineapple'])
sunf = -int(config['Inventory']['Sunflower-Seed'])
royal = -int(config['Inventory']['Royal-Jelly'])
charm = -int(config['Inventory']['Moon-Charm'])
bean = -int(config['Inventory']['Magic-Bean'])

#MATH TIME!!!

if 0 < glue + 250:
    dispenser = int(input("How much glue do you get from the glue dispenser? "))
    glue += 250
    gumdrops += glue*50
    royal += glue*10

if 0 < enzymes + 100:
    enzymes += 100
    pineap += enzymes*50
    royal += enzymes*10

if 0 < oil + 100:
    oil += 100
    sunf += oil*50
    royal += oil*10

if 0 < glitter + 100:
    glitter += 100
    charm += glitter*25
    bean += glitter

#prints
print("")
print("")
print("")
#major prints
if glue > 0:
    print(f"You need {glue} Glue, needing {gumdrops} gumdrops")
    print(f"If you do glue dispenser every day, youll get this in at most {math.ceil((glue/dispenser)*22/24)} days")
    tickets = math.ceil((glue*50)/3)
    print(f"You can buy that with {tickets} tickets or {gumdrops*3} Strawberries, Blueberries, and Pineapples TOTAL")
    print("")

if enzymes > 0:
    print(f"You need {enzymes} Enzymes, needing {pineap} Pineapples")

if oil > 0:
    print(f"You need {oil} Oil, needing {sunf} Sunflower Seeds")

if glitter > 0:
    print(f"You need {glitter} Glitter")

print("")

print("Extra mats")
if royal > 0:
    print(f"You need {royal} royal jelly")
if charm > 0:
    print(f"You need {charm} Moon charms")
if bean > 0:
    print(f"You need {bean} Magic beans")
