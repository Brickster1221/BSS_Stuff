import configparser

config = configparser.ConfigParser()
config.read('Inventory.ini')
print(config['Inventory']['hello']
