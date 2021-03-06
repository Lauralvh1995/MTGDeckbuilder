﻿DROP TABLE deckList;
DROP TABLE cardColorIdentity;
DROP TABLE cardColor;
DROP TABLE cardTypeCard;
DROP TABLE deck;
DROP TABLE color;
DROP TABLE ParentType;
DROP TABLE cardType;
DROP TABLE cardRarity;
DROP TABLE rarity;
DROP TABLE mtgCard;
DROP TABLE cardSet;

CREATE TABLE cardSet(
name Nvarchar(255),
code Nvarchar(5) PRIMARY KEY,
code_magiccards Nvarchar(255),
releasedate Nvarchar(255)
);

CREATE TABLE deck(
ID int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(255) UNIQUE,
active bit,
completed bit
);

CREATE TABLE mtgCard(
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(1000),
setcode nvarchar(5) FOREIGN KEY REFERENCES cardSet(code),
manacost nvarchar(255),
converted_manacost int,
P int,
T int,
L int,
rulesText nvarchar(2500),
flavor nvarchar(1000),
artist nvarchar(255),
generated_mana nvarchar(255)
);

CREATE TABLE cardType(
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(255),
permanent bit
);

CREATE TABLE ParentType(
TypeID int FOREIGN KEY REFERENCES cardType(id),
ParentID int,

CONSTRAINT PK_Ptype PRIMARY KEY (TypeID,ParentID)
);

CREATE TABLE color(
name nvarchar(255),
code nvarchar(3) PRIMARY KEY
);

CREATE TABLE cardTypeCard(
cardID int FOREIGN KEY REFERENCES mtgCard(ID),
cardType int FOREIGN KEY REFERENCES cardType(id),

CONSTRAINT PK_type PRIMARY KEY (cardID,cardType)
);

CREATE TABLE cardColor(
cardID int FOREIGN KEY REFERENCES mtgCard(ID),
colorCode nvarchar(3) FOREIGN KEY REFERENCES color(code),

CONSTRAINT PK_color PRIMARY KEY (cardID,colorCode)
);

CREATE TABLE cardColorIdentity(
cardID int FOREIGN KEY REFERENCES mtgCard(ID),
colorCode nvarchar(3) FOREIGN KEY REFERENCES color(code),

CONSTRAINT PK_colorIdentity PRIMARY KEY (cardID,colorCode)
);

CREATE TABLE deckList(
ID int IDENTITY(1,1) PRIMARY KEY,
DeckID int FOREIGN KEY REFERENCES deck(ID),
CardID int FOREIGN KEY REFERENCES mtgCard(ID)
);

CREATE TABLE rarity(
name nvarchar(255),
code int IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE cardRarity(
cardID int FOREIGN KEY REFERENCES mtgCard(ID) PRIMARY KEY,
rarity int FOREIGN KEY REFERENCES rarity(code)

);

INSERT INTO cardset VALUES
('Aether Revolt','AER','AER','01/2017'),
('Alara Reborn','ARB','ARB','04/2009'),
('Alliances','ALL','AI','06/1996'),
('Amonkhet','AKH','AKH','04/2017'),
('Antiquities','ATQ','AQ','04/1994'),
('Apocalypse','APC','AP','05/2001'),
('Arabian Nights','ARN','AN','12/1993'),
('Avacyn Restored','AVR','AVR','05/2012'),
('Battle for Zendikar','BFZ','BFZ','10/2015'),
('Betrayers of Kamigawa','BOK','BOK','01/2005'),
('Born of the Gods','BNG','BNG','02/2014'),
('Champions of Kamigawa','CHK','CHK','09/2004'),
('Chronicles','CHR','CH','07/1995'),
('Coldsnap','CSP','CS','06/2006'),
('Commander','CMD','CMD','06/2011'),
('Commander 2013 Edition','C13','C13','11/2013'),
('Commander 2014 Edition','C14','C14','11/2014'),
('Commander 2015 Edition','C15','C15','11/2015'),
('Commander 2016 Edition','C16','C16','11/2016'),
('Commander 2017 Edition','C17','C17','08/2017'),
('Commander Anthology','CMA','CMA','05/2017'),
('Commander''s Arsenal','CM1','CMA','11/2012'),
('Conflux','CFX','CFX','01/2009'),
('Dark Ascension','DKA','DKA','02/2012'),
('Darksteel','DST','DS','01/2004'),
('Dissension','DIS','DI','04/2006'),
('Dragon''s Maze','DGM','DGM','05/2013'),
('Dragons of Tarkir','DTK','DTK','03/2015'),
('Eighth Edition','8ED','8E','07/2003'),
('Eighth Edition Box Set','8EDB','8EB','07/2003'),
('Eldritch Moon','EMN','EMN','07/2016'),
('Eternal Masters','EMA','EMA','06/2016'),
('Eventide','EVE','EVE','07/2008'),
('Exodus','EXO','EX','06/1998'),
('Fallen Empires','FEM','FE','10/1994'),
('Fate Reforged','FRF','FRF','01/2015'),
('Fifth Dawn','5DN','5DN','05/2004'),
('Fifth Edition','5ED','5E','03/1997'),
('Fourth Edition','4ED','4E','04/1995'),
('Future Sight','FUT','FUT','05/2007'),
('Gatecrash','GTC','GTC','01/2013'),
('Guildpact','GPT','GP','01/2006'),
('Homelands','HLM','HL','10/1995'),
('Hour of Devastation','HOU','HOU','07/2017'),
('Ice Age','ICE','IA','06/1995'),
('Iconic Masters','IMA','IMA','11/2017'),
('Innistrad','ISD','ISD','09/2011'),
('Invasion','INV','IN','09/2000'),
('Ixalan','XLN','XLN','09/2017'),
('Journey into Nyx','JOU','JOU','05/2014'),
('Judgment','JUD','JU','05/2002'),
('Kaladesh','KLD','KLD','09/2016'),
('Khans of Tarkir','KTK','KTK','09/2014'),
('Legends','LEG','LG','06/1994'),
('Legions','LGN','LE','01/2003'),
('Limited Edition Alpha','LEA','AL','08/1993'),
('Limited Edition Beta','LEB','BE','10/1993'),
('Lorwyn','LRW','LW','09/2007'),
('Magic 2010 Core Set','M10','M10','07/2009'),
('Magic 2011 Core Set','M11','M11','07/2010'),
('Magic 2012 Core Set','M12','M12','07/2011'),
('Magic 2013 Core Set','M13','M13','07/2012'),
('Magic 2014 Core Set','M14','M14','07/2013'),
('Magic 2015 Core Set','M15','M15','07/2014'),
('Magic Origins','ORI','ORI','07/2015'),
('Mercadian Masques','MMQ','MM','09/1999'),
('Mirage','MIR','MR','10/1996'),
('Mirrodin Besieged','MBS','MBS','01/2011'),
('Modern Masters','MMA','MMA','06/2013'),
('Modern Masters 2015 Edition','MM2','MM2','05/2015'),
('Modern Masters 2017 Edition','MM3','MM3','03/2017'),
('Morningtide','MOR','MT','01/2008'),
('Nemesis','NMS','NE','02/2000'),
('New Phyrexia','NPH','NPH','05/2011'),
('Ninth Edition','9ED','9E','07/2005'),
('Ninth Edition Box Set','9EDB','9EB','07/2005'),
('Oath of the Gatewatch','OGW','OGW','01/2016'),
('Odyssey','ODY','OD','09/2001'),
('Onslaught','ONS','ON','09/2002'),
('Planar Chaos','PLC','PC','01/2007'),
('Planeshift','PLS','PS','01/2001'),
('Portal','POR','PO','06/1997'),
('Portal Second Age','PO2','PO2','06/1998'),
('Portal Three Kingdoms','PTK','P3K','06/1999'),
('Prophecy','PCY','PR','05/2000'),
('Ravnica: City of Guilds','RAV','RAV','09/2005'),
('Return to Ravnica','RTR','RTR','10/2012'),
('Revised Edition','3ED','RV','04/1994'),
('Rise of the Eldrazi','ROE','ROE','04/2010'),
('Saviors of Kamigawa','SOK','SOK','05/2005'),
('Scars of Mirrodin','SOM','SOM','09/2010'),
('Scourge','SCG','SC','05/2003'),
('Seventh Edition','7ED','7E','04/2001'),
('Shadowmoor','SHM','SHM','04/2008'),
('Shadows over Innistrad','SOI','SOI','04/2016'),
('Shards of Alara','ALA','ALA','09/2008'),
('Sixth Edition','6ED','6E','04/1999'),
('Starter 1999','S99','ST','07/1999'),
('Starter 2000','S00','ST2K','07/2000'),
('Stronghold','STH','SH','02/1998'),
('Tempest','TMP','TP','10/1997'),
('Tenth Edition','10E','10E','07/2007'),
('The Dark','DRK','DK','08/1994'),
('Theros','THS','THS','09/2013'),
('Time Spiral','TSP','TS','09/2006'),
('Time Spiral "Timeshifted"','TSB','TSTS','09/2006'),
('Torment','TOR','TR','01/2002'),
('Unlimited Edition','2ED','UN','12/1993'),
('Urza''s Destiny','UDD','UD','05/1999'),
('Urza''s Legacy','UDL','UL','02/1999'),
('Urza''s Saga','UDS','US','10/1998'),
('Visions','VIS','VI','02/1997'),
('Weatherlight','WTH','WL','05/1997'),
('Welcome Deck 2016','W16','W16','04/2016'),
('Welcome Deck 2017','W17','W17','04/2017'),
('Worldwake','WWK','WWK','01/2010'),
('Zendikar','ZEN','ZEN','09/2009'),
('Alpha', '1ED', 'ALP', '8/1993');

INSERT INTO color VALUES
('White', 'W'),
('Blue', 'U'),
('Black', 'B'),
('Red', 'R'),
('Green', 'G'),
('Colorless', 'C');

INSERT INTO rarity (name) VALUES
('Common'),
('Uncommon'),
('Rare'),
('MythicRare'),
('Timeshifted'),
('Masterpiece');

INSERT INTO cardType (name, permanent) VALUES
('Basic', 1),
('Legendary',  1),
('Artifact', 1),
('Creature', 1),
('Land', 1),
('Enchantment', 1),
('Planeswalker', 1),
('Instant', 0),
('Sorcery', 0),
('Tribal', 0),
('Equipment', 1),
('Fortification', 1),
('Vehicle', 1),
('Aura', 1),
('Curse', 1),
('Cartouche', 1),
('Shrine', 1),
('Forest', 1),
('Island', 1),
('Plains', 1),
('Mountain', 1),
('Swamp', 1),
('Desert', 1),
('Gate', 1),
('Locus', 1),
('Lair', 1),
('Urza''s', 1),
('Mine',  1),
('Power-Plant', 1),
('Tower',  1),
('Advisor', 1),
('Aetherborn', 1),
('Ally', 1),
('Angel', 1),
('Antelope', 1),
('Ape', 1),
('Archer', 1),
('Archon', 1),
('Artificer', 1),
('Assassin', 1),
('Assembly-Worker', 1),
('Atog', 1),
('Aurochs', 1),
('Avatar', 1),
('Badger', 1),
('Barbarian', 1),
('Basilisk', 1),
('Bat', 1),
('Bear', 1),
('Beast', 1),
('Beeble', 1),
('Berserker', 1),
('Bird', 1),
('Blinkmoth', 1),
('Boar', 1),
('Bringer', 1),
('Brushwagg', 1),
('Camarid', 1),
('Camel', 1),
('Caribou', 1),
('Carrier', 1),
('Cat', 1),
('Centaur', 1),
('Cephalid', 1),
('Chimera', 1),
('Citizen', 1),
('Cleric', 1),
('Cockatrice', 1),
('Construct', 1),
('Coward', 1),
('Crab', 1),
('Crocodile', 1),
('Cyclops', 1),
('Dauthi', 1),
('Demon', 1),
('Deserter', 1),
('Devil', 1),
('Dinosaur', 1),
('Djinn', 1),
('Dragon', 1),
('Drake', 1),
('Dreadnought', 1),
('Drone', 1),
('Druid', 1),
('Dryad', 1),
('Dwarf', 1),
('Efreet', 1),
('Elder', 1),
('Eldrazi', 1),
('Elemental', 1),
('Elephant', 1),
('Elf', 1),
('Elk', 1),
('Eye', 1),
('Faerie', 1),
('Ferret', 1),
('Fish', 1),
('Flagbearer', 1),
('Fox', 1),
('Frog', 1),
('Fungus', 1),
('Gargoyle', 1),
('Germ', 1),
('Giant', 1),
('Gnome', 1),
('Goat', 1),
('Goblin', 1),
('God', 1),
('Golem', 1),
('Gorgon', 1),
('Graveborn', 1),
('Gremlin', 1),
('Griffin', 1),
('Hag', 1),
('Harpy', 1),
('Hellion', 1),
('Hippo', 1),
('Hippogriff', 1),
('Homarid', 1),
('Homunculus', 1),
('Horror', 1),
('Horse', 1),
('Hound', 1),
('Human', 1),
('Hydra', 1),
('Hyena', 1),
('Illusion', 1),
('Imp', 1),
('Incarnation', 1),
('Insect', 1),
('Jackal', 1),
('Jellyfish', 1),
('Juggernaut', 1),
('Kavu', 1),
('Kirin', 1),
('Kithkin', 1),
('Knight', 1),
('Kobold', 1),
('Kor', 1),
('Kraken', 1),
('Lamia', 1),
('Lammasu', 1),
('Leech', 1),
('Leviathan', 1),
('Lhurgoyf', 1),
('Licid', 1),
('Lizard', 1),
('Manticore', 1),
('Masticore', 1),
('Mercenary', 1),
('Merfolk', 1),
('Metathran', 1),
('Minion', 1),
('Minotaur', 1),
('Mole', 1),
('Monger', 1),
('Mongoose', 1),
('Monk', 1),
('Monkey', 1),
('Moonfolk', 1),
('Mutant', 1),
('Myr', 1),
('Mystic', 1),
('Naga', 1),
('Nautilus', 1),
('Nephilim', 1),
('Nightmare', 1),
('Nightstalker', 1),
('Ninja', 1),
('Noggle', 1),
('Nomad', 1),
('Nymph', 1),
('Octopus', 1),
('Ogre', 1),
('Ooze', 1),
('Orb', 1),
('Orc', 1),
('Orgg', 1),
('Ouphe', 1),
('Ox', 1),
('Oyster', 1),
('Pegasus', 1),
('Pentavite', 1),
('Pest', 1),
('Phelddagrif', 1),
('Phoenix', 1),
('Pilot', 1),
('Pincher', 1),
('Pirate', 1),
('Plant', 1),
('Praetor', 1),
('Prism', 1),
('Processor', 1),
('Rabbit', 1),
('Rat', 1),
('Rebel', 1),
('Reflection', 1),
('Rhino', 1),
('Rigger', 1),
('Rogue', 1),
('Sable', 1),
('Salamander', 1),
('Samurai', 1),
('Sand', 1),
('Saproling', 1),
('Satyr', 1),
('Scarecrow', 1),
('Scion', 1),
('Scorpion', 1),
('Scout', 1),
('Serf', 1),
('Serpent', 1),
('Servo', 1),
('Shade', 1),
('Shaman', 1),
('Shapeshifter', 1),
('Sheep', 1),
('Siren', 1),
('Skeleton', 1),
('Slith', 1),
('Sliver', 1),
('Slug', 1),
('Snake', 1),
('Soldier', 1),
('Soltari', 1),
('Spawn', 1),
('Specter', 1),
('Spellshaper', 1),
('Sphinx', 1),
('Spider', 1),
('Spike', 1),
('Spirit', 1),
('Splinter', 1),
('Sponge', 1),
('Squid', 1),
('Squirrel', 1),
('Starfish', 1),
('Surrakar', 1),
('Survivor', 1),
('Tetravite', 1),
('Thalakos', 1),
('Thopter', 1),
('Thrull', 1),
('Treefolk', 1),
('Trilobite', 1),
('Triskelavite', 1),
('Troll', 1),
('Turtle', 1),
('Unicorn', 1),
('Vampire', 1),
('Vedalken', 1),
('Viashino', 1),
('Volver', 1),
('Wall', 1),
('Warrior', 1),
('Weird', 1),
('Werewolf', 1),
('Whale', 1),
('Wizard', 1),
('Wolf', 1),
('Wolverine', 1),
('Wombat', 1),
('Worm', 1),
('Wraith', 1),
('Wurm', 1),
('Yeti', 1),
('Zombie', 1),
('Zubera', 1),
('Ajani', 1),
('Arlinn', 1),
('Ashiok', 1), 
('Bolas', 1), 
('Chandra', 1), 
('Dack', 1), 
('Daretti', 1), 
('Domri', 1), 
('Dovin', 1), 
('Elspeth', 1), 
('Freyalise', 1), 
('Garruk', 1), 
('Gideon', 1), 
('Huatli', 1), 
('Jace', 1), 
('Karn', 1), 
('Kaya', 1), 
('Kiora', 1), 
('Koth', 1), 
('Liliana', 1), 
('Nahiri', 1), 
('Narset', 1), 
('Nissa', 1), 
('Nixilis', 1), 
('Ral', 1), 
('Saheeli', 1), 
('Samut', 1), 
('Sarkhan', 1), 
('Sorin', 1), 
('Tamiyo', 1), 
('Teferi', 1), 
('Tezzeret', 1), 
('Tibalt', 1), 
('Ugin', 1), 
('Venser', 1), 
('Vraska', 1),
('Xenagos', 1);
INSERT INTO ParentType VALUES (10, 8);
INSERT INTO ParentType VALUES (10, 9);
insert into ParentType (typeID, parentID) values (11, 3);
insert into ParentType (typeID, parentID) values (12, 3);
insert into ParentType (typeID, parentID) values (13, 3);
insert into ParentType (typeID, parentID) values (14, 6);
insert into ParentType (typeID, parentID) values (15, 6);
insert into ParentType (typeID, parentID) values (16, 6);
insert into ParentType (typeID, parentID) values (17, 6);
insert into ParentType (typeID, parentID) values (18, 5);
insert into ParentType (typeID, parentID) values (19, 5);
insert into ParentType (typeID, parentID) values (20, 5);
insert into ParentType (typeID, parentID) values (21, 5);
insert into ParentType (typeID, parentID) values (22, 5);
insert into ParentType (typeID, parentID) values (23, 5);
insert into ParentType (typeID, parentID) values (24, 5);
insert into ParentType (typeID, parentID) values (25, 5);
insert into ParentType (typeID, parentID) values (26, 5);
insert into ParentType (typeID, parentID) values (27, 5);
insert into ParentType (typeID, parentID) values (28, 5);
insert into ParentType (typeID, parentID) values (29, 5);
insert into ParentType (typeID, parentID) values (30, 5);
insert into ParentType (typeID, parentID) values (31, 4);
insert into ParentType (typeID, parentID) values (32, 4);
insert into ParentType (typeID, parentID) values (33, 4);
insert into ParentType (typeID, parentID) values (34, 4);
insert into ParentType (typeID, parentID) values (35, 4);
insert into ParentType (typeID, parentID) values (36, 4);
insert into ParentType (typeID, parentID) values (37, 4);
insert into ParentType (typeID, parentID) values (38, 4);
insert into ParentType (typeID, parentID) values (39, 4);
insert into ParentType (typeID, parentID) values (40, 4);
insert into ParentType (typeID, parentID) values (41, 4);
insert into ParentType (typeID, parentID) values (42, 4);
insert into ParentType (typeID, parentID) values (43, 4);
insert into ParentType (typeID, parentID) values (44, 4);
insert into ParentType (typeID, parentID) values (45, 4);
insert into ParentType (typeID, parentID) values (46, 4);
insert into ParentType (typeID, parentID) values (47, 4);
insert into ParentType (typeID, parentID) values (48, 4);
insert into ParentType (typeID, parentID) values (49, 4);
insert into ParentType (typeID, parentID) values (50, 4);
insert into ParentType (typeID, parentID) values (51, 4);
insert into ParentType (typeID, parentID) values (52, 4);
insert into ParentType (typeID, parentID) values (53, 4);
insert into ParentType (typeID, parentID) values (54, 4);
insert into ParentType (typeID, parentID) values (55, 4);
insert into ParentType (typeID, parentID) values (56, 4);
insert into ParentType (typeID, parentID) values (57, 4);
insert into ParentType (typeID, parentID) values (58, 4);
insert into ParentType (typeID, parentID) values (59, 4);
insert into ParentType (typeID, parentID) values (60, 4);
insert into ParentType (typeID, parentID) values (61, 4);
insert into ParentType (typeID, parentID) values (62, 4);
insert into ParentType (typeID, parentID) values (63, 4);
insert into ParentType (typeID, parentID) values (64, 4);
insert into ParentType (typeID, parentID) values (65, 4);
insert into ParentType (typeID, parentID) values (66, 4);
insert into ParentType (typeID, parentID) values (67, 4);
insert into ParentType (typeID, parentID) values (68, 4);
insert into ParentType (typeID, parentID) values (69, 4);
insert into ParentType (typeID, parentID) values (70, 4);
insert into ParentType (typeID, parentID) values (71, 4);
insert into ParentType (typeID, parentID) values (72, 4);
insert into ParentType (typeID, parentID) values (73, 4);
insert into ParentType (typeID, parentID) values (74, 4);
insert into ParentType (typeID, parentID) values (75, 4);
insert into ParentType (typeID, parentID) values (76, 4);
insert into ParentType (typeID, parentID) values (77, 4);
insert into ParentType (typeID, parentID) values (78, 4);
insert into ParentType (typeID, parentID) values (79, 4);
insert into ParentType (typeID, parentID) values (80, 4);
insert into ParentType (typeID, parentID) values (81, 4);
insert into ParentType (typeID, parentID) values (82, 4);
insert into ParentType (typeID, parentID) values (83, 4);
insert into ParentType (typeID, parentID) values (84, 4);
insert into ParentType (typeID, parentID) values (85, 4);
insert into ParentType (typeID, parentID) values (86, 4);
insert into ParentType (typeID, parentID) values (87, 4);
insert into ParentType (typeID, parentID) values (88, 4);
insert into ParentType (typeID, parentID) values (89, 4);
insert into ParentType (typeID, parentID) values (90, 4);
insert into ParentType (typeID, parentID) values (91, 4);
insert into ParentType (typeID, parentID) values (92, 4);
insert into ParentType (typeID, parentID) values (93, 4);
insert into ParentType (typeID, parentID) values (94, 4);
insert into ParentType (typeID, parentID) values (95, 4);
insert into ParentType (typeID, parentID) values (96, 4);
insert into ParentType (typeID, parentID) values (97, 4);
insert into ParentType (typeID, parentID) values (98, 4);
insert into ParentType (typeID, parentID) values (99, 4);
insert into ParentType (typeID, parentID) values (100, 4);
insert into ParentType (typeID, parentID) values (101, 4);
insert into ParentType (typeID, parentID) values (102, 4);
insert into ParentType (typeID, parentID) values (103, 4);
insert into ParentType (typeID, parentID) values (104, 4);
insert into ParentType (typeID, parentID) values (105, 4);
insert into ParentType (typeID, parentID) values (106, 4);
insert into ParentType (typeID, parentID) values (107, 4);
insert into ParentType (typeID, parentID) values (108, 4);
insert into ParentType (typeID, parentID) values (109, 4);
insert into ParentType (typeID, parentID) values (110, 4);
insert into ParentType (typeID, parentID) values (111, 4);
insert into ParentType (typeID, parentID) values (112, 4);
insert into ParentType (typeID, parentID) values (113, 4);
insert into ParentType (typeID, parentID) values (114, 4);
insert into ParentType (typeID, parentID) values (115, 4);
insert into ParentType (typeID, parentID) values (116, 4);
insert into ParentType (typeID, parentID) values (117, 4);
insert into ParentType (typeID, parentID) values (118, 4);
insert into ParentType (typeID, parentID) values (119, 4);
insert into ParentType (typeID, parentID) values (120, 4);
insert into ParentType (typeID, parentID) values (121, 4);
insert into ParentType (typeID, parentID) values (122, 4);
insert into ParentType (typeID, parentID) values (123, 4);
insert into ParentType (typeID, parentID) values (124, 4);
insert into ParentType (typeID, parentID) values (125, 4);
insert into ParentType (typeID, parentID) values (126, 4);
insert into ParentType (typeID, parentID) values (127, 4);
insert into ParentType (typeID, parentID) values (128, 4);
insert into ParentType (typeID, parentID) values (129, 4);
insert into ParentType (typeID, parentID) values (130, 4);
insert into ParentType (typeID, parentID) values (131, 4);
insert into ParentType (typeID, parentID) values (132, 4);
insert into ParentType (typeID, parentID) values (133, 4);
insert into ParentType (typeID, parentID) values (134, 4);
insert into ParentType (typeID, parentID) values (135, 4);
insert into ParentType (typeID, parentID) values (136, 4);
insert into ParentType (typeID, parentID) values (137, 4);
insert into ParentType (typeID, parentID) values (138, 4);
insert into ParentType (typeID, parentID) values (139, 4);
insert into ParentType (typeID, parentID) values (140, 4);
insert into ParentType (typeID, parentID) values (141, 4);
insert into ParentType (typeID, parentID) values (142, 4);
insert into ParentType (typeID, parentID) values (143, 4);
insert into ParentType (typeID, parentID) values (144, 4);
insert into ParentType (typeID, parentID) values (145, 4);
insert into ParentType (typeID, parentID) values (146, 4);
insert into ParentType (typeID, parentID) values (147, 4);
insert into ParentType (typeID, parentID) values (148, 4);
insert into ParentType (typeID, parentID) values (149, 4);
insert into ParentType (typeID, parentID) values (150, 4);
insert into ParentType (typeID, parentID) values (151, 4);
insert into ParentType (typeID, parentID) values (152, 4);
insert into ParentType (typeID, parentID) values (153, 4);
insert into ParentType (typeID, parentID) values (154, 4);
insert into ParentType (typeID, parentID) values (155, 4);
insert into ParentType (typeID, parentID) values (156, 4);
insert into ParentType (typeID, parentID) values (157, 4);
insert into ParentType (typeID, parentID) values (158, 4);
insert into ParentType (typeID, parentID) values (159, 4);
insert into ParentType (typeID, parentID) values (160, 4);
insert into ParentType (typeID, parentID) values (161, 4);
insert into ParentType (typeID, parentID) values (162, 4);
insert into ParentType (typeID, parentID) values (163, 4);
insert into ParentType (typeID, parentID) values (164, 4);
insert into ParentType (typeID, parentID) values (165, 4);
insert into ParentType (typeID, parentID) values (166, 4);
insert into ParentType (typeID, parentID) values (167, 4);
insert into ParentType (typeID, parentID) values (168, 4);
insert into ParentType (typeID, parentID) values (169, 4);
insert into ParentType (typeID, parentID) values (170, 4);
insert into ParentType (typeID, parentID) values (171, 4);
insert into ParentType (typeID, parentID) values (172, 4);
insert into ParentType (typeID, parentID) values (173, 4);
insert into ParentType (typeID, parentID) values (174, 4);
insert into ParentType (typeID, parentID) values (175, 4);
insert into ParentType (typeID, parentID) values (176, 4);
insert into ParentType (typeID, parentID) values (177, 4);
insert into ParentType (typeID, parentID) values (178, 4);
insert into ParentType (typeID, parentID) values (179, 4);
insert into ParentType (typeID, parentID) values (180, 4);
insert into ParentType (typeID, parentID) values (181, 4);
insert into ParentType (typeID, parentID) values (182, 4);
insert into ParentType (typeID, parentID) values (183, 4);
insert into ParentType (typeID, parentID) values (184, 4);
insert into ParentType (typeID, parentID) values (185, 4);
insert into ParentType (typeID, parentID) values (186, 4);
insert into ParentType (typeID, parentID) values (187, 4);
insert into ParentType (typeID, parentID) values (188, 4);
insert into ParentType (typeID, parentID) values (189, 4);
insert into ParentType (typeID, parentID) values (190, 4);
insert into ParentType (typeID, parentID) values (191, 4);
insert into ParentType (typeID, parentID) values (192, 4);
insert into ParentType (typeID, parentID) values (193, 4);
insert into ParentType (typeID, parentID) values (194, 4);
insert into ParentType (typeID, parentID) values (195, 4);
insert into ParentType (typeID, parentID) values (196, 4);
insert into ParentType (typeID, parentID) values (197, 4);
insert into ParentType (typeID, parentID) values (198, 4);
insert into ParentType (typeID, parentID) values (199, 4);
insert into ParentType (typeID, parentID) values (200, 4);
insert into ParentType (typeID, parentID) values (201, 4);
insert into ParentType (typeID, parentID) values (202, 4);
insert into ParentType (typeID, parentID) values (203, 4);
insert into ParentType (typeID, parentID) values (204, 4);
insert into ParentType (typeID, parentID) values (205, 4);
insert into ParentType (typeID, parentID) values (206, 4);
insert into ParentType (typeID, parentID) values (207, 4);
insert into ParentType (typeID, parentID) values (208, 4);
insert into ParentType (typeID, parentID) values (209, 4);
insert into ParentType (typeID, parentID) values (210, 4);
insert into ParentType (typeID, parentID) values (211, 4);
insert into ParentType (typeID, parentID) values (212, 4);
insert into ParentType (typeID, parentID) values (213, 4);
insert into ParentType (typeID, parentID) values (214, 4);
insert into ParentType (typeID, parentID) values (215, 4);
insert into ParentType (typeID, parentID) values (216, 4);
insert into ParentType (typeID, parentID) values (217, 4);
insert into ParentType (typeID, parentID) values (218, 4);
insert into ParentType (typeID, parentID) values (219, 4);
insert into ParentType (typeID, parentID) values (220, 4);
insert into ParentType (typeID, parentID) values (221, 4);
insert into ParentType (typeID, parentID) values (222, 4);
insert into ParentType (typeID, parentID) values (223, 4);
insert into ParentType (typeID, parentID) values (224, 4);
insert into ParentType (typeID, parentID) values (225, 4);
insert into ParentType (typeID, parentID) values (226, 4);
insert into ParentType (typeID, parentID) values (227, 4);
insert into ParentType (typeID, parentID) values (228, 4);
insert into ParentType (typeID, parentID) values (229, 4);
insert into ParentType (typeID, parentID) values (230, 4);
insert into ParentType (typeID, parentID) values (231, 4);
insert into ParentType (typeID, parentID) values (232, 4);
insert into ParentType (typeID, parentID) values (233, 4);
insert into ParentType (typeID, parentID) values (234, 4);
insert into ParentType (typeID, parentID) values (235, 4);
insert into ParentType (typeID, parentID) values (236, 4);
insert into ParentType (typeID, parentID) values (237, 4);
insert into ParentType (typeID, parentID) values (238, 4);
insert into ParentType (typeID, parentID) values (239, 4);
insert into ParentType (typeID, parentID) values (240, 4);
insert into ParentType (typeID, parentID) values (241, 4);
insert into ParentType (typeID, parentID) values (242, 4);
insert into ParentType (typeID, parentID) values (243, 4);
insert into ParentType (typeID, parentID) values (244, 4);
insert into ParentType (typeID, parentID) values (245, 4);
insert into ParentType (typeID, parentID) values (246, 4);
insert into ParentType (typeID, parentID) values (247, 4);
insert into ParentType (typeID, parentID) values (248, 4);
insert into ParentType (typeID, parentID) values (249, 4);
insert into ParentType (typeID, parentID) values (250, 4);
insert into ParentType (typeID, parentID) values (251, 4);
insert into ParentType (typeID, parentID) values (252, 4);
insert into ParentType (typeID, parentID) values (253, 4);
insert into ParentType (typeID, parentID) values (254, 4);
insert into ParentType (typeID, parentID) values (255, 4);
insert into ParentType (typeID, parentID) values (256, 4);
insert into ParentType (typeID, parentID) values (257, 4);
insert into ParentType (typeID, parentID) values (258, 4);
insert into ParentType (typeID, parentID) values (259, 4);
insert into ParentType (typeID, parentID) values (260, 4);
insert into ParentType (typeID, parentID) values (261, 4);
insert into ParentType (typeID, parentID) values (262, 4);
insert into ParentType (typeID, parentID) values (263, 4);
insert into ParentType (typeID, parentID) values (264, 4);
insert into ParentType (typeID, parentID) values (265, 4);
insert into ParentType (typeID, parentID) values (266, 4);
insert into ParentType (typeID, parentID) values (267, 4);
insert into ParentType (typeID, parentID) values (268, 4);
insert into ParentType (typeID, parentID) values (31, 10);
insert into ParentType (typeID, parentID) values (32, 10);
insert into ParentType (typeID, parentID) values (33, 10);
insert into ParentType (typeID, parentID) values (34, 10);
insert into ParentType (typeID, parentID) values (35, 10);
insert into ParentType (typeID, parentID) values (36, 10);
insert into ParentType (typeID, parentID) values (37, 10);
insert into ParentType (typeID, parentID) values (38, 10);
insert into ParentType (typeID, parentID) values (39, 10);
insert into ParentType (typeID, parentID) values (40, 10);
insert into ParentType (typeID, parentID) values (41, 10);
insert into ParentType (typeID, parentID) values (42, 10);
insert into ParentType (typeID, parentID) values (43, 10);
insert into ParentType (typeID, parentID) values (44, 10);
insert into ParentType (typeID, parentID) values (45, 10);
insert into ParentType (typeID, parentID) values (46, 10);
insert into ParentType (typeID, parentID) values (47, 10);
insert into ParentType (typeID, parentID) values (48, 10);
insert into ParentType (typeID, parentID) values (49, 10);
insert into ParentType (typeID, parentID) values (50, 10);
insert into ParentType (typeID, parentID) values (51, 10);
insert into ParentType (typeID, parentID) values (52, 10);
insert into ParentType (typeID, parentID) values (53, 10);
insert into ParentType (typeID, parentID) values (54, 10);
insert into ParentType (typeID, parentID) values (55, 10);
insert into ParentType (typeID, parentID) values (56, 10);
insert into ParentType (typeID, parentID) values (57, 10);
insert into ParentType (typeID, parentID) values (58, 10);
insert into ParentType (typeID, parentID) values (59, 10);
insert into ParentType (typeID, parentID) values (60, 10);
insert into ParentType (typeID, parentID) values (61, 10);
insert into ParentType (typeID, parentID) values (62, 10);
insert into ParentType (typeID, parentID) values (63, 10);
insert into ParentType (typeID, parentID) values (64, 10);
insert into ParentType (typeID, parentID) values (65, 10);
insert into ParentType (typeID, parentID) values (66, 10);
insert into ParentType (typeID, parentID) values (67, 10);
insert into ParentType (typeID, parentID) values (68, 10);
insert into ParentType (typeID, parentID) values (69, 10);
insert into ParentType (typeID, parentID) values (70, 10);
insert into ParentType (typeID, parentID) values (71, 10);
insert into ParentType (typeID, parentID) values (72, 10);
insert into ParentType (typeID, parentID) values (73, 10);
insert into ParentType (typeID, parentID) values (74, 10);
insert into ParentType (typeID, parentID) values (75, 10);
insert into ParentType (typeID, parentID) values (76, 10);
insert into ParentType (typeID, parentID) values (77, 10);
insert into ParentType (typeID, parentID) values (78, 10);
insert into ParentType (typeID, parentID) values (79, 10);
insert into ParentType (typeID, parentID) values (80, 10);
insert into ParentType (typeID, parentID) values (81, 10);
insert into ParentType (typeID, parentID) values (82, 10);
insert into ParentType (typeID, parentID) values (83, 10);
insert into ParentType (typeID, parentID) values (84, 10);
insert into ParentType (typeID, parentID) values (85, 10);
insert into ParentType (typeID, parentID) values (86, 10);
insert into ParentType (typeID, parentID) values (87, 10);
insert into ParentType (typeID, parentID) values (88, 10);
insert into ParentType (typeID, parentID) values (89, 10);
insert into ParentType (typeID, parentID) values (90, 10);
insert into ParentType (typeID, parentID) values (91, 10);
insert into ParentType (typeID, parentID) values (92, 10);
insert into ParentType (typeID, parentID) values (93, 10);
insert into ParentType (typeID, parentID) values (94, 10);
insert into ParentType (typeID, parentID) values (95, 10);
insert into ParentType (typeID, parentID) values (96, 10);
insert into ParentType (typeID, parentID) values (97, 10);
insert into ParentType (typeID, parentID) values (98, 10);
insert into ParentType (typeID, parentID) values (99, 10);
insert into ParentType (typeID, parentID) values (100, 10);
insert into ParentType (typeID, parentID) values (101, 10);
insert into ParentType (typeID, parentID) values (102, 10);
insert into ParentType (typeID, parentID) values (103, 10);
insert into ParentType (typeID, parentID) values (104, 10);
insert into ParentType (typeID, parentID) values (105, 10);
insert into ParentType (typeID, parentID) values (106, 10);
insert into ParentType (typeID, parentID) values (107, 10);
insert into ParentType (typeID, parentID) values (108, 10);
insert into ParentType (typeID, parentID) values (109, 10);
insert into ParentType (typeID, parentID) values (110, 10);
insert into ParentType (typeID, parentID) values (111, 10);
insert into ParentType (typeID, parentID) values (112, 10);
insert into ParentType (typeID, parentID) values (113, 10);
insert into ParentType (typeID, parentID) values (114, 10);
insert into ParentType (typeID, parentID) values (115, 10);
insert into ParentType (typeID, parentID) values (116, 10);
insert into ParentType (typeID, parentID) values (117, 10);
insert into ParentType (typeID, parentID) values (118, 10);
insert into ParentType (typeID, parentID) values (119, 10);
insert into ParentType (typeID, parentID) values (120, 10);
insert into ParentType (typeID, parentID) values (121, 10);
insert into ParentType (typeID, parentID) values (122, 10);
insert into ParentType (typeID, parentID) values (123, 10);
insert into ParentType (typeID, parentID) values (124, 10);
insert into ParentType (typeID, parentID) values (125, 10);
insert into ParentType (typeID, parentID) values (126, 10);
insert into ParentType (typeID, parentID) values (127, 10);
insert into ParentType (typeID, parentID) values (128, 10);
insert into ParentType (typeID, parentID) values (129, 10);
insert into ParentType (typeID, parentID) values (130, 10);
insert into ParentType (typeID, parentID) values (131, 10);
insert into ParentType (typeID, parentID) values (132, 10);
insert into ParentType (typeID, parentID) values (133, 10);
insert into ParentType (typeID, parentID) values (134, 10);
insert into ParentType (typeID, parentID) values (135, 10);
insert into ParentType (typeID, parentID) values (136, 10);
insert into ParentType (typeID, parentID) values (137, 10);
insert into ParentType (typeID, parentID) values (138, 10);
insert into ParentType (typeID, parentID) values (139, 10);
insert into ParentType (typeID, parentID) values (140, 10);
insert into ParentType (typeID, parentID) values (141, 10);
insert into ParentType (typeID, parentID) values (142, 10);
insert into ParentType (typeID, parentID) values (143, 10);
insert into ParentType (typeID, parentID) values (144, 10);
insert into ParentType (typeID, parentID) values (145, 10);
insert into ParentType (typeID, parentID) values (146, 10);
insert into ParentType (typeID, parentID) values (147, 10);
insert into ParentType (typeID, parentID) values (148, 10);
insert into ParentType (typeID, parentID) values (149, 10);
insert into ParentType (typeID, parentID) values (150, 10);
insert into ParentType (typeID, parentID) values (151, 10);
insert into ParentType (typeID, parentID) values (152, 10);
insert into ParentType (typeID, parentID) values (153, 10);
insert into ParentType (typeID, parentID) values (154, 10);
insert into ParentType (typeID, parentID) values (155, 10);
insert into ParentType (typeID, parentID) values (156, 10);
insert into ParentType (typeID, parentID) values (157, 10);
insert into ParentType (typeID, parentID) values (158, 10);
insert into ParentType (typeID, parentID) values (159, 10);
insert into ParentType (typeID, parentID) values (160, 10);
insert into ParentType (typeID, parentID) values (161, 10);
insert into ParentType (typeID, parentID) values (162, 10);
insert into ParentType (typeID, parentID) values (163, 10);
insert into ParentType (typeID, parentID) values (164, 10);
insert into ParentType (typeID, parentID) values (165, 10);
insert into ParentType (typeID, parentID) values (166, 10);
insert into ParentType (typeID, parentID) values (167, 10);
insert into ParentType (typeID, parentID) values (168, 10);
insert into ParentType (typeID, parentID) values (169, 10);
insert into ParentType (typeID, parentID) values (170, 10);
insert into ParentType (typeID, parentID) values (171, 10);
insert into ParentType (typeID, parentID) values (172, 10);
insert into ParentType (typeID, parentID) values (173, 10);
insert into ParentType (typeID, parentID) values (174, 10);
insert into ParentType (typeID, parentID) values (175, 10);
insert into ParentType (typeID, parentID) values (176, 10);
insert into ParentType (typeID, parentID) values (177, 10);
insert into ParentType (typeID, parentID) values (178, 10);
insert into ParentType (typeID, parentID) values (179, 10);
insert into ParentType (typeID, parentID) values (180, 10);
insert into ParentType (typeID, parentID) values (181, 10);
insert into ParentType (typeID, parentID) values (182, 10);
insert into ParentType (typeID, parentID) values (183, 10);
insert into ParentType (typeID, parentID) values (184, 10);
insert into ParentType (typeID, parentID) values (185, 10);
insert into ParentType (typeID, parentID) values (186, 10);
insert into ParentType (typeID, parentID) values (187, 10);
insert into ParentType (typeID, parentID) values (188, 10);
insert into ParentType (typeID, parentID) values (189, 10);
insert into ParentType (typeID, parentID) values (190, 10);
insert into ParentType (typeID, parentID) values (191, 10);
insert into ParentType (typeID, parentID) values (192, 10);
insert into ParentType (typeID, parentID) values (193, 10);
insert into ParentType (typeID, parentID) values (194, 10);
insert into ParentType (typeID, parentID) values (195, 10);
insert into ParentType (typeID, parentID) values (196, 10);
insert into ParentType (typeID, parentID) values (197, 10);
insert into ParentType (typeID, parentID) values (198, 10);
insert into ParentType (typeID, parentID) values (199, 10);
insert into ParentType (typeID, parentID) values (200, 10);
insert into ParentType (typeID, parentID) values (201, 10);
insert into ParentType (typeID, parentID) values (202, 10);
insert into ParentType (typeID, parentID) values (203, 10);
insert into ParentType (typeID, parentID) values (204, 10);
insert into ParentType (typeID, parentID) values (205, 10);
insert into ParentType (typeID, parentID) values (206, 10);
insert into ParentType (typeID, parentID) values (207, 10);
insert into ParentType (typeID, parentID) values (208, 10);
insert into ParentType (typeID, parentID) values (209, 10);
insert into ParentType (typeID, parentID) values (210, 10);
insert into ParentType (typeID, parentID) values (211, 10);
insert into ParentType (typeID, parentID) values (212, 10);
insert into ParentType (typeID, parentID) values (213, 10);
insert into ParentType (typeID, parentID) values (214, 10);
insert into ParentType (typeID, parentID) values (215, 10);
insert into ParentType (typeID, parentID) values (216, 10);
insert into ParentType (typeID, parentID) values (217, 10);
insert into ParentType (typeID, parentID) values (218, 10);
insert into ParentType (typeID, parentID) values (219, 10);
insert into ParentType (typeID, parentID) values (220, 10);
insert into ParentType (typeID, parentID) values (221, 10);
insert into ParentType (typeID, parentID) values (222, 10);
insert into ParentType (typeID, parentID) values (223, 10);
insert into ParentType (typeID, parentID) values (224, 10);
insert into ParentType (typeID, parentID) values (225, 10);
insert into ParentType (typeID, parentID) values (226, 10);
insert into ParentType (typeID, parentID) values (227, 10);
insert into ParentType (typeID, parentID) values (228, 10);
insert into ParentType (typeID, parentID) values (229, 10);
insert into ParentType (typeID, parentID) values (230, 10);
insert into ParentType (typeID, parentID) values (231, 10);
insert into ParentType (typeID, parentID) values (232, 10);
insert into ParentType (typeID, parentID) values (233, 10);
insert into ParentType (typeID, parentID) values (234, 10);
insert into ParentType (typeID, parentID) values (235, 10);
insert into ParentType (typeID, parentID) values (236, 10);
insert into ParentType (typeID, parentID) values (237, 10);
insert into ParentType (typeID, parentID) values (238, 10);
insert into ParentType (typeID, parentID) values (239, 10);
insert into ParentType (typeID, parentID) values (240, 10);
insert into ParentType (typeID, parentID) values (241, 10);
insert into ParentType (typeID, parentID) values (242, 10);
insert into ParentType (typeID, parentID) values (243, 10);
insert into ParentType (typeID, parentID) values (244, 10);
insert into ParentType (typeID, parentID) values (245, 10);
insert into ParentType (typeID, parentID) values (246, 10);
insert into ParentType (typeID, parentID) values (247, 10);
insert into ParentType (typeID, parentID) values (248, 10);
insert into ParentType (typeID, parentID) values (249, 10);
insert into ParentType (typeID, parentID) values (250, 10);
insert into ParentType (typeID, parentID) values (251, 10);
insert into ParentType (typeID, parentID) values (252, 10);
insert into ParentType (typeID, parentID) values (253, 10);
insert into ParentType (typeID, parentID) values (254, 10);
insert into ParentType (typeID, parentID) values (255, 10);
insert into ParentType (typeID, parentID) values (256, 10);
insert into ParentType (typeID, parentID) values (257, 10);
insert into ParentType (typeID, parentID) values (258, 10);
insert into ParentType (typeID, parentID) values (259, 10);
insert into ParentType (typeID, parentID) values (260, 10);
insert into ParentType (typeID, parentID) values (261, 10);
insert into ParentType (typeID, parentID) values (262, 10);
insert into ParentType (typeID, parentID) values (263, 10);
insert into ParentType (typeID, parentID) values (264, 10);
insert into ParentType (typeID, parentID) values (265, 10);
insert into ParentType (typeID, parentID) values (266, 10);
insert into ParentType (typeID, parentID) values (267, 10);
insert into ParentType (typeID, parentID) values (268, 10);
insert into ParentType (typeID, parentID) values (269, 7);
insert into ParentType (typeID, parentID) values (270, 7);
insert into ParentType (typeID, parentID) values (271, 7);
insert into ParentType (typeID, parentID) values (272, 7);
insert into ParentType (typeID, parentID) values (273, 7);
insert into ParentType (typeID, parentID) values (274, 7);
insert into ParentType (typeID, parentID) values (275, 7);
insert into ParentType (typeID, parentID) values (276, 7);
insert into ParentType (typeID, parentID) values (277, 7);
insert into ParentType (typeID, parentID) values (278, 7);
insert into ParentType (typeID, parentID) values (279, 7);
insert into ParentType (typeID, parentID) values (280, 7);
insert into ParentType (typeID, parentID) values (281, 7);
insert into ParentType (typeID, parentID) values (282, 7);
insert into ParentType (typeID, parentID) values (283, 7);
insert into ParentType (typeID, parentID) values (284, 7);
insert into ParentType (typeID, parentID) values (285, 7);
insert into ParentType (typeID, parentID) values (286, 7);
insert into ParentType (typeID, parentID) values (287, 7);
insert into ParentType (typeID, parentID) values (288, 7);
insert into ParentType (typeID, parentID) values (289, 7);
insert into ParentType (typeID, parentID) values (290, 7);
insert into ParentType (typeID, parentID) values (291, 7);
insert into ParentType (typeID, parentID) values (292, 7);
insert into ParentType (typeID, parentID) values (293, 7);
insert into ParentType (typeID, parentID) values (294, 7);
insert into ParentType (typeID, parentID) values (295, 7);
insert into ParentType (typeID, parentID) values (296, 7);
insert into ParentType (typeID, parentID) values (297, 7);
insert into ParentType (typeID, parentID) values (298, 7);
insert into ParentType (typeID, parentID) values (299, 7);
insert into ParentType (typeID, parentID) values (300, 7);
insert into ParentType (typeID, parentID) values (301, 7);
insert into ParentType (typeID, parentID) values (302, 7);
insert into ParentType (typeID, parentID) values (303, 7);
insert into ParentType (typeID, parentID) values (304, 7);
insert into ParentType (typeID, parentID) values (305, 7);



insert into Deck (name, active, completed) values ('urna', 1, 1);
insert into Deck (name, active, completed) values ('erat tortor sollicitudin',0,1);
insert into Deck (name, active, completed) values ('orci vehicula condimentum', 0, 1);
insert into Deck (name, active, completed) values ('aliquam', 0, 1);
insert into Deck (name, active, completed) values ('nam dui', 0, 0);
insert into Deck (name, active, completed) values ('id luctus nec', 0, 1);
insert into Deck (name, active, completed) values ('interdum mauris', 1, 1);
insert into Deck (name, active, completed) values ('tortor risus dapibus', 0, 0);
insert into Deck (name, active, completed) values ('lorem', 0, 1);
insert into Deck (name, active, completed) values ('mauris enim leo', 0, 0);
insert into Deck (name, active, completed) values ('erat vestibulum sed', 0, 0);
insert into Deck (name, active, completed) values ('sollicitudin mi', 1, 1);
insert into Deck (name, active, completed) values ('pretium iaculis', 1, 1);
insert into Deck (name, active, completed) values ('auctor sed', 0, 0);
insert into Deck (name, active, completed) values ('iaculis diam', 1, 1);
insert into Deck (name, active, completed) values ('nulla pede', 0, 1);
insert into Deck (name, active, completed) values ('at ipsum', 0, 1);
insert into Deck (name, active, completed) values ('porttitor lorem', 0, 0);
insert into Deck (name, active, completed) values ('congue diam', 0, 1);
insert into Deck (name, active, completed) values ('sit amet', 1, 0);

INSERT INTO mtgcard (name, setcode, manacost, converted_manacost, P, T, L, rulesText, flavor, artist, generated_mana) VALUES
('Aegis Automaton','AER','{2}','2','0','3','','{4}{W}: Return another target creature you control to its owner''s hand.','#_The streets of Ghirapur have become dangerous. It''s good to have a dependable companion._#','Kieran Yanner',''),
('Aerial Modification','AER','{4}{W}','5','','','','Enchant creature or Vehicle£As long as enchanted permanent is a Vehicle, it''s a creature in addition to its other types.£Enchanted creature gets +2/+2 and has flying.','','Jung Park',''),
('Aeronaut Admiral','AER','{3}{W}','4','3','1','','Flying£Vehicles you control have flying.','#_The Consulate recruits its best pilots from the League of Aeronauts. Many go on to command entire fleets._#','E. M. Gist',''),
('Aether Chaser','AER','{1}{R}','2','2','1','','First strike£When Aether Chaser enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Aether Chaser attacks, you may pay {E}{E}. If you do, create a 1/1 colorless Servo artifact creature token.','','Jason Rainville',''),
('Aether Herder','AER','{3}{G}','4','3','3','','When Aether Herder enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Aether Herder attacks, you may pay {E}{E}. If you do, create a 1/1 colorless Servo artifact creature token.','','Victor Adame Minguez',''),
('Aether Inspector','AER','{3}{W}','4','2','3','','Vigilance£When Aether Inspector enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Aether Inspector attacks, you may pay {E}{E}. If you do, create a 1/1 colorless Servo artifact creature token.','','Sidharth Chaturvedi',''),
('Aether Poisoner','AER','{1}{B}','2','1','1','','Deathtouch #_(Any amount of damage this deals to a creature is enough to destroy it.)_#£When Aether Poisoner enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Aether Poisoner attacks, you may pay {E}{E}. If you do, create a 1/1 colorless Servo artifact creature token.','','Yongjae Choi',''),
('Aether Swooper','AER','{1}{U}','2','1','2','','Flying£When Aether Swooper enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Aether Swooper attacks, you may pay {E}{E}. If you do, create a 1/1 colorless Servo artifact creature token.','','James Ryman',''),
('Aethergeode Miner','AER','{1}{W}','2','3','1','','Whenever Aethergeode Miner attacks, you get {E}{E} #_(two energy counters)_#.£Pay {E}{E}: Exile Aethergeode Miner, then return it to the battlefield under its owner''s control.','#_Gremlins in the wild feed on nodules of pure aether, which are also prized by miners._#','Winona Nelson',''),
('Aethersphere Harvester','AER','{3}','3','3','5','','Flying£When Aethersphere Harvester enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Pay {E}: Aethersphere Harvester gains lifelink until end of turn.£Crew 1 #_(Tap any number of creatures you control with total power 1 or more: This Vehicle becomes an artifact creature until end of turn.)_#','','Christine Choi',''),
('Aetherstream Leopard','AER','{2}{G}','3','2','3','','Trample£When Aetherstream Leopard enters the battlefield, you get {E} #_(an energy counter)_#.£Whenever Aetherstream Leopard attacks, you may pay {E}. If you do, it gets +2/+0 until end of turn.','','Winona Nelson',''),
('Aethertide Whale','AER','{4}{U}{U}','6','6','4','','Flying£When Aethertide Whale enters the battlefield, you get {E}{E}{E}{E}{E}{E} #_(six energy counters)_#.£Pay {E}{E}{E}{E}: Return Aethertide Whale to its owner''s hand.','#_"To survive up here, I''ve learned when to use my harpoon and when to just enjoy the view."£—Kadhu, skywhaler_#','Steven Belledin',''),
('Aetherwind Basker','AER','{4}{G}{G}{G}','7','7','7','','Trample£Whenever Aetherwind Basker enters the battlefield or attacks, you get {E} #_(an energy counter)_# for each creature you control.£Pay {E}: Aetherwind Basker gets +1/+1 until end of turn.','#_Its frill inspired the design of efficient aether collectors._#','Svetlin Velinov',''),
('Aid from the Cowl','AER','{3}{G}{G}','5','','','','Revolt — At the beginning of your end step, if a permanent you controlled left the battlefield this turn, reveal the top card of your library. If it''s a permanent card, you may put it onto the battlefield. Otherwise, you may put it on the bottom of your library.','','Viktor Titov',''),
('Airdrop Aeronauts','AER','{3}{W}{W}','5','4','3','','Flying£Revolt — When Airdrop Aeronauts enters the battlefield, if a permanent you controlled left the battlefield this turn, you gain 5 life.','#_"Supplies inbound. Keep that pressure on."_#','Greg Opalinski',''),
('Ajani Unyielding','AER','{4}{G}{W}','6','','','4','+2: Reveal the top three cards of your library. Put all nonland permanent cards revealed this way into your hand and the rest on the bottom of your library in any order.£−2: Exile target creature. Its controller gains life equal to its power.£−9: Put five +1/+1 counters on each creature you control and five loyalty counters on each other planeswalker you control.','','Kieran Yanner',''),
('Ajani, Valiant Protector','AER','{4}{G}{W}','6','','','4','+2: Put two +1/+1 counters on up to one target creature.£+1: Reveal cards from the top of your library until you reveal a creature card. Put that card into your hand and the rest on the bottom of your library in a random order.£−11: Put X +1/+1 counters on target creature, where X is your life total. That creature gains trample until end of turn.','','Anna Steinbauer',''),
('Ajani''s Aid','AER','{2}{G}{W}','4','','','','When Ajani''s Aid enters the battlefield, you may search your library and/or graveyard for a card named Ajani, Valiant Protector, reveal it, and put it into your hand. If you search your library this way, shuffle it.£Sacrifice Ajani''s Aid: Prevent all combat damage a creature of your choice would deal this turn.','','Terese Nielsen',''),
('Ajani''s Comrade','AER','{1}{G}','2','2','2','','Trample£At the beginning of combat on your turn, if you control an Ajani planeswalker, put a +1/+1 counter on Ajani''s Comrade.','#_"I will go where the lion-man leads."_#','James Ryman',''),
('Alley Evasion','AER','{W}','1','','','','Choose one —£• Target creature you control gets +1/+2 until end of turn.£• Return target creature you control to its owner''s hand.','#_"Sure, you know the law. But I know the streets."_#','Scott Murphy',''),
('Alley Strangler','AER','{2}{B}','3','2','3','','Menace','#_"You never know what day might be your last."_#','Efflam Mercier',''),
('Audacious Infiltrator','AER','{1}{W}','2','3','1','','Audacious Infiltrator can''t be blocked by artifact creatures.','#_"This little critter can turn all of you to scrap in under thirty seconds! Come on, who wants to be the first to go? Try and stop me!"_#','Jakub Kasper',''),
('Augmenting Automaton','AER','{1}','1','1','1','','{1}{B}: Augmenting Automaton gets +1/+1 until end of turn.','#_When you have taught an automaton how to build others of its kind, it is a small step to make it build itself._#','Jason Rainville',''),
('Baral, Chief of Compliance','AER','{1}{U}','2','1','3','','Instant and sorcery spells you cast cost {1} less to cast.£Whenever a spell or ability you control counters a spell, you may draw a card. If you do, discard a card.','#_"The echo of silence is music to my ears."_#','Wesley Burt',''),
('Baral''s Expertise','AER','{3}{U}{U}','5','','','','Return up to three target artifacts and/or creatures to their owners'' hands.£You may cast a card with converted mana cost 4 or less from your hand without paying its mana cost.','#_"Get out of my way."_#','Todd Lockwood',''),
('Barricade Breaker','AER','{7}','7','7','5','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Barricade Breaker attacks each combat if able.','#_"The Consulate sought to crush us. Let''s give them a taste of their own medicine."£—Venkat Dasai, renegade commander_#','Karl Kopinski',''),
('Bastion Enforcer','AER','{2}{W}','3','3','2','','','#_Headquartered at the Bastion of the Honorable, the Consulate''s enforcers are charged with the impossible task of keeping the peace._#','Matt Stewart',''),
('Bastion Inventor','AER','{5}{U}','6','4','4','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Hexproof #_(This creature can''t be the target of spells or abilities your opponents control.)_#','#_"This armor transcends the limitations of mere flesh and bone."_#','Tony Foti',''),
('Battle at the Bridge','AER','{X}{B}','1','','','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Target creature gets -X/-X until end of turn. You gain X life.','#_"This is bigger than you. All of you."£—Tezzeret_#','Chris Rallis',''),
('Call for Unity','AER','{3}{W}{W}','5','','','','Revolt — At the beginning of your end step, if a permanent you controlled left the battlefield this turn, put a unity counter on Call for Unity.£Creatures you control get +1/+1 for each unity counter on Call for Unity.','#_The "leaking spire" stands for liberation from Consulate control._#','John Severin Brassell',''),
('Caught in the Brights','AER','{2}{W}','3','','','','Enchant creature£Enchanted creature can''t attack or block.£When a Vehicle you control attacks, exile enchanted creature.','#_While hunting aether, a gremlin may ignore other stimuli, including threats to its own life._#','Kieran Yanner',''),
('Chandra''s Revolution','AER','{3}{R}','4','','','','Chandra''s Revolution deals 4 damage to target creature. Tap target land. That land doesn''t untap during its controller''s next untap step.','#_Chandra was driven by her anger, directed particularly at the man who had taken her father from her._#','Clint Cearley',''),
('Cogwork Assembler','AER','{3}','3','2','3','','{7}: Create a token that''s a copy of target artifact. That token gains haste. Exile it at the beginning of the next end step.','#_Duplication is neither thievery nor flattery. It is efficiency._#','Joseph Meehan',''),
('Consulate Crackdown','AER','{3}{W}{W}','5','','','','When Consulate Crackdown enters the battlefield, exile all artifacts your opponents control until Consulate Crackdown leaves the battlefield.','#_"The workshops are silent. Our creations have been seized. They have killed what made us alive."£—Pia Nalaar_#','Jonas De Ro',''),
('Consulate Dreadnought','AER','{1}','1','7','11','','Crew 6 #_(Tap any number of creatures you control with total power 6 or more: This Vehicle becomes an artifact creature until end of turn.)_#','#_"It''s like they planted another Bastion right in the middle of the harbor."£—Bes Tavani, Bomat merchant_#','Cliff Childs',''),
('Consulate Turret','AER','{3}','3','','','','{T}: You get {E} #_(an energy counter)_#.£{T}, Pay {E}{E}{E}: Consulate Turret deals 2 damage to target player.','#_"Our watchtowers are well positioned. Why don''t we arm them?"£—Enforcer-Chief Ranaj_#','Eric Deschamps',''),
('Conviction','AER','{1}{W}','2','','','','Enchant creature£Enchanted creature gets +1/+3.£{W}: Return Conviction to its owner''s hand.','#_"There is no greater coward than one who believes in nothing."_#','John Stanko',''),
('Countless Gears Renegade','AER','{1}{W}','2','2','2','','Revolt — When Countless Gears Renegade enters the battlefield, if a permanent you controlled left the battlefield this turn, create a 1/1 colorless Servo artifact creature token.','#_"Go forth and cause trouble, my little one!"_#','Dan Scott',''),
('Crackdown Construct','AER','{4}','4','2','2','','Whenever you activate an ability of an artifact or creature that isn''t a mana ability, Crackdown Construct gets +1/+1 until end of turn.','#_"All buildings are subject to search. Resistance will be punished."£—Enforcer-Chief Ranaj_#','Johannes Voss',''),
('Cruel Finality','AER','{2}{B}','3','','','','Target creature gets -2/-2 until end of turn. Scry 1. #_(Look at the top card of your library. You may put that card on the bottom of your library.)_#','#_Bitter the bite of a demon''s steel, and deep the abyss it opens._#','Svetlin Velinov',''),
('Daredevil Dragster','AER','{3}','3','4','4','','At end of combat, if Daredevil Dragster attacked or blocked this combat, put a velocity counter on it. Then if it has two or more velocity counters on it, sacrifice it and draw two cards.£Crew 2 #_(Tap any number of creatures you control with total power 2 or more: This Vehicle becomes an artifact creature until end of turn.)_#','','Titus Lunter',''),
('Daring Demolition','AER','{2}{B}{B}','4','','','','Destroy target creature or Vehicle.','#_Living so close to death gives the aetherborn an unusual perspective on risk._#','Svetlin Velinov',''),
('Dark Intimations','AER','{2}{U}{B}{R}','5','','','','Each opponent sacrifices a creature or planeswalker, then discards a card. You return a creature or planeswalker card from your graveyard to your hand, then draw a card.£When you cast a Bolas planeswalker spell, exile Dark Intimations from your graveyard. That planeswalker enters the battlefield with an additional loyalty counter on it.','','Chase Stone','{U}{R}{B}'),
('Dawnfeather Eagle','AER','{4}{W}','5','3','3','','Flying£When Dawnfeather Eagle enters the battlefield, creatures you control get +1/+1 and gain vigilance until end of turn.','#_"It came to rest upon the angel''s arm, and then the weight of their gazes fell upon me."£—Aeronaut''s journal_#','Sidharth Chaturvedi',''),
('Deadeye Harpooner','AER','{2}{W}','3','2','2','','Revolt — When Deadeye Harpooner enters the battlefield, if a permanent you controlled left the battlefield this turn, destroy target tapped creature an opponent controls.','#_"It seems there''s even better hunting down here."_#','Ryan Pancoast',''),
('Decommission','AER','{2}{W}','3','','','','Destroy target artifact or enchantment.£Revolt — If a permanent you controlled left the battlefield this turn, you gain 3 life.','#_"A key weakness in the design is its vulnerability to repeated, forceful blows."_#','Josh Hass',''),
('Defiant Salvager','AER','{2}{B}','3','2','2','','Sacrifice an artifact or creature: Put a +1/+1 counter on Defiant Salvager. Activate this ability only any time you could cast a sorcery.','#_"I didn''t survive that crash just so I could fall to the likes of you."_#','Volkan Baga',''),
('Deft Dismissal','AER','{3}{W}','4','','','','Deft Dismissal deals 3 damage divided as you choose among one, two, or three target attacking or blocking creatures.','#_"With spy thopters all around, how can the consuls be so blind to Tezzeret''s manipulations?"£—Gideon Jura_#','Izzy',''),
('Destructive Tampering','AER','{2}{R}','3','','','','Choose one —£• Destroy target artifact.£• Creatures without flying can''t block this turn.','#_"I don''t think they''ll appreciate my . . . adjustments."£—Karavin, renegade saboteur_#','Titus Lunter',''),
('Disallow','AER','{1}{U}{U}','3','','','','Counter target spell, activated ability, or triggered ability. #_(Mana abilities can''t be targeted.)_#','#_"How easily your flames are quenched."£—Baral, Chief of Compliance_#','Min Yum',''),
('Dispersal Technician','AER','{4}{U}','5','3','2','','When Dispersal Technician enters the battlefield, you may return target artifact to its owner''s hand.','#_As renegade forces closed in on the Aether Spire, Consulate blockades failed one by one._#','Scott Murphy',''),
('Druid of the Cowl','AER','{1}{G}','2','1','3','','{T}: Add {G} to your mana pool.','#_"The wild tangle of the Cowl provides sanctuary to life that watched the first buildings rise."_#','Magali Villeneuve','{G}'),
('Efficient Construction','AER','{3}{U}','4','','','','Whenever you cast an artifact spell, create a 1/1 colorless Thopter artifact creature token with flying.','#_For some of Ghirapur''s aerowrights, building thopters is a byproduct of larger construction efforts._#','Jonas De Ro',''),
('Embraal Gear-Smasher','AER','{2}{R}','3','2','3','','{T}, Sacrifice an artifact: Embraal Gear-Smasher deals 2 damage to each opponent.','#_"A well-made wrench is a versatile, indispensable tool."_#','Joseph Meehan',''),
('Enraged Giant','AER','{5}{R}','6','4','4','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Trample, haste','#_When fighting spilled over into Giant''s Walk, the aether weapons and swooping airships angered the normally placid creatures._#','Anthony Palumbo',''),
('Exquisite Archangel','AER','{5}{W}{W}','7','5','5','','Flying£If you would lose the game, instead exile Exquisite Archangel and your life total becomes equal to your starting life total.','#_A living invention born of a grand design._#','Brad Rigney',''),
('Fatal Push','AER','{B}','1','','','','Destroy target creature if it has converted mana cost 2 or less.£Revolt — Destroy that creature if it has converted mana cost 4 or less instead if a permanent you controlled left the battlefield this turn.','','Eric Deschamps',''),
('Felidar Guardian','AER','{3}{W}','4','1','4','','When Felidar Guardian enters the battlefield, you may exile another target permanent you control, then return that card to the battlefield under its owner''s control.','#_The loyalty of a felidar is hard won but worth the effort._#','Jakub Kasper',''),
('Fen Hauler','AER','{6}{B}','7','5','5','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Fen Hauler can''t be blocked by artifact creatures.','#_"Success is found where others fear to look."£—Ara, renegade smuggler_#','Sidharth Chaturvedi',''),
('Filigree Crawler','AER','{4}','4','2','2','','When Filigree Crawler dies, create a 1/1 colorless Thopter artifact creature token with flying.','#_"The most harmonious designs are based on relationships found in nature."£—Venand Kapur, the Gearherder_#','James Paick',''),
('Foundry Assembler','AER','{5}','5','3','3','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#','#_"They never tire, they never complain, and they never ask questions. Build more."£—Ivash, Consulate inventor_#','Karl Kopinski',''),
('Foundry Hornet','AER','{3}{B}','4','2','3','','Flying£When Foundry Hornet enters the battlefield, if you control a creature with a +1/+1 counter on it, creatures your opponents control get -1/-1 until end of turn.','#_Its buzzing is easily mistaken for the hum of a thopter''s wings._#','Christopher Moeller',''),
('Fourth Bridge Prowler','AER','{B}','1','1','1','','When Fourth Bridge Prowler enters the battlefield, you may have target creature get -1/-1 until end of turn.','#_Renegades run the gamut from lofty sages to petty thieves._#','John Silva',''),
('Freejam Regent','AER','{4}{R}{R}','6','4','4','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Flying£{1}{R}: Freejam Regent gets +2/+0 until end of turn.','#_The dragons perching in Freejam''s towers symbolize the zone''s fierce independence._#','Volkan Baga',''),
('Frontline Rebel','AER','{2}{R}','3','3','3','','Frontline Rebel attacks each combat if able.','#_"Will you be strong and stand with me?"_#','Winona Nelson',''),
('Precise Strike','AER','{R}','1','','','','Target creature gets +1/+0 and gains first strike until end of turn.','#_"Hit where it hurts, and always hit first."_#','Tyler Jacobson',''),
('Prey Upon','AER','{G}','1','','','','Target creature you control fights target creature you don''t control. #_(Each deals damage equal to its power to the other.)_#','#_It is the nature of the strong to survive._#','Ryan Pancoast',''),
('Prizefighter Construct','AER','{5}','5','6','2','','','#_The Scrappers, an underground group with a passion for automaton brawls, had renegade leanings even before the Consulate''s crackdown. It didn''t take long for them to lend their best brawlers to the conflict._#','Daniel Ljunggren',''),
('Quicksmith Rebel','AER','{3}{R}','4','3','2','','When Quicksmith Rebel enters the battlefield, target artifact you control gains "{T}: This artifact deals 2 damage to target creature or player" for as long as you control Quicksmith Rebel.','#_"Let''s add just a bit more stopping power."_#','Kieran Yanner',''),
('Quicksmith Spy','AER','{3}{U}','4','2','3','','When Quicksmith Spy enters the battlefield, target artifact you control gains "{T}: Draw a card" for as long as you control Quicksmith Spy.','#_"Let''s just broaden its surveillance lens."_#','Ryan Alexander Lee',''),
('Ravenous Intruder','AER','{1}{R}','2','1','2','','Sacrifice an artifact: Ravenous Intruder gets +2/+2 until end of turn.','#_"I''ve made some fine acquisitions of late, so I''m planning to make commensurate improvements to my security systems. I have a consultant coming tomorrow."£—Kurna Majan, Luminary League_#','Mathias Kollros',''),
('Reckless Racer','AER','{2}{R}','3','2','3','','First strike£Whenever Reckless Racer becomes tapped, you may discard a card. If you do, draw a card.','#_Illegal street races turned out to be perfect practice for avoiding Consulate patrols._#','Viktor Titov',''),
('Release the Gremlins','AER','{X}{X}{R}','1','','','','Destroy X target artifacts. Create X 2/2 red Gremlin creature tokens.','#_"Being an inventor means knowing how to use the tools at hand to make something great—or to bring it down."£—Pia Nalaar_#','Izzy',''),
('Renegade Map','AER','{1}','1','','','','Renegade Map enters the battlefield tapped.£{T}, Sacrifice Renegade Map: Search your library for a basic land card, reveal it, put it into your hand, then shuffle your library.','#_"We have safe houses in every zone, but you''ll never find one without this."_#','Lake Hurwitz',''),
('Renegade Rallier','AER','{1}{G}{W}','3','3','2','','Revolt — When Renegade Rallier enters the battlefield, if a permanent you controlled left the battlefield this turn, return target permanent card with converted mana cost 2 or less from your graveyard to the battlefield.','#_"This fight belongs to us all."_#','Kieran Yanner',''),
('Renegade Wheelsmith','AER','{1}{R}{W}','3','3','2','','Whenever Renegade Wheelsmith becomes tapped, target creature can''t block this turn.','#_Many veterans of the Ovalchase racetrack turned their talents to the renegade cause._#','Darek Zabrocki',''),
('Renegade''s Getaway','AER','{2}{B}','3','','','','Target permanent gains indestructible until end of turn. Create a 1/1 colorless Servo artifact creature token. #_(Effects that say "destroy" don''t destroy a permanent with indestructible, and if it''s a creature, it can''t be destroyed by damage.)_#','#_You can''t fight what you can''t find._#','Ryan Yee',''),
('Reservoir Walker','AER','{5}','5','3','3','','When Reservoir Walker enters the battlefield, you gain 3 life and get {E}{E}{E} #_(three energy counters)_#.','#_Renegade supply lines are, by necessity, mobile and difficult to disrupt._#','Johann Bodin',''),
('Resourceful Return','AER','{1}{B}','2','','','','Return target creature card from your graveyard to your hand. If you control an artifact, draw a card.','#_When the salvage team brought in the shattered gearhulk, a wave of excitement swept through the renegade foundry._#','Titus Lunter',''),
('Restoration Specialist','AER','{1}{W}','2','2','1','','{W}, Sacrifice Restoration Specialist: Return up to one target artifact card and up to one target enchantment card from your graveyard to your hand.','#_Dwarves'' tools are priceless heirlooms handed down through generations._#','David Palumbo',''),
('Reverse Engineer','AER','{3}{U}{U}','5','','','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Draw three cards.','#_The Hold, an illegal research facility in a derelict merchant ship, became a wellspring of renegade intelligence._#','Chase Stone',''),
('Ridgescale Tusker','AER','{3}{G}{G}','5','5','5','','When Ridgescale Tusker enters the battlefield, put a +1/+1 counter on each other creature you control.','#_"Each creature holds a solution to a problem, a lesson to be learned."£—Oviya Pashiri, sage lifecrafter_#','Winona Nelson',''),
('Rishkar, Peema Renegade','AER','{2}{G}','3','2','2','','When Rishkar, Peema Renegade enters the battlefield, put a +1/+1 counter on each of up to two target creatures.£Each creature you control with a counter on it has "{T}: Add {G} to your mana pool."','#_"Aether is the soul of Kaladesh, and all souls should be free."_#','Todd Lockwood',''),
('Rishkar''s Expertise','AER','{4}{G}{G}','6','','','','Draw cards equal to the greatest power among creatures you control.£You may cast a card with converted mana cost 5 or less from your hand without paying its mana cost.','#_"Control the Great Conduit? You might as well try to divert a river with your hands."_#','Magali Villeneuve',''),
('Rogue Refiner','AER','{1}{G}{U}','3','3','2','','When Rogue Refiner enters the battlefield, draw a card and you get {E}{E} #_(two energy counters)_#.','#_"It''s natural, it''s all around us, and it''s there for the taking. Just try and tell me what I''m doing is wrong."_#','Victor Adame Minguez',''),
('Salvage Scuttler','AER','{4}{U}','5','4','4','','Whenever Salvage Scuttler attacks, return an artifact you control to its owner''s hand.','#_A hermit crab goes through many shells in its lifetime, and not all are natural in origin._#','Tony Foti',''),
('Scrap Trawler','AER','{3}','3','3','2','','Whenever Scrap Trawler or another artifact you control is put into a graveyard from the battlefield, return to your hand target artifact card in your graveyard with lesser converted mana cost.','','Daarken',''),
('Scrapper Champion','AER','{3}{R}','4','2','2','','Double strike #_(This creature deals both first-strike and regular combat damage.)_#£When Scrapper Champion enters the battlefield, you get {E}{E} #_(two energy counters)_#.£Whenever Scrapper Champion attacks, you may pay {E}{E}. If you do, put a +1/+1 counter on it.','','Magali Villeneuve',''),
('Scrounging Bandar','AER','{1}{G}','2','0','0','','Scrounging Bandar enters the battlefield with two +1/+1 counters on it.£At the beginning of your upkeep, you may move any number of +1/+1 counters from Scrounging Bandar onto another target creature.','#_"It was right here a second ago . . ."_#','Shreya Shetty',''),
('Secret Salvage','AER','{3}{B}{B}','5','','','','Exile target nonland card from your graveyard. Search your library for any number of cards with the same name as that card, reveal them, and put them into your hand. Then shuffle your library.','#_There is no shortage of illegal salvage in Ghirapur, nor of those who are willing to profit from it._#','Tommy Arnold',''),
('Servo Schematic','AER','{2}','2','','','','When Servo Schematic enters the battlefield or is put into a graveyard from the battlefield, create a 1/1 colorless Servo artifact creature token.','#_The Consulate prizes innovation when it is dependable and replicable._#','Titus Lunter',''),
('Shielded Aether Thief','AER','{1}{U}','2','0','4','','Flash #_(You may cast this spell any time you could cast an instant.)_#£Whenever Shielded Aether Thief blocks, you get {E} #_(an energy counter)_#.£{T}, Pay {E}{E}{E}: Draw a card.','#_Conflict breeds opportunity._#','Lake Hurwitz',''),
('Shipwreck Moray','AER','{3}{U}','4','0','5','','When Shipwreck Moray enters the battlefield, you get {E}{E}{E}{E} #_(four energy counters)_#.£Pay {E}: Shipwreck Moray gets +2/-2 until end of turn.','#_Shipwrecks do wonders for the local fauna, providing both shelter and aether._#','Mike Bierek',''),
('Shock','AER','{R}','1','','','','Shock deals 2 damage to target creature or player.','#_The tools of invention became the weapons of revolution._#','Jason Rainville',''),
('Siege Modification','AER','{1}{R}{R}','3','','','','Enchant creature or Vehicle£As long as enchanted permanent is a Vehicle, it''s a creature in addition to its other types.£Enchanted creature gets +3/+0 and has first strike.','#_Perfect for getting through to the consuls._#','Sung Choi',''),
('Silkweaver Elite','AER','{2}{G}','3','2','2','','Reach #_(This creature can block creatures with flying.)_#£Revolt — When Silkweaver Elite enters the battlefield, if a permanent you controlled left the battlefield this turn, draw a card.','#_Elvish weavers use spidersilk to make everything from tapestries to rappelling ropes._#','Magali Villeneuve',''),
('Skyship Plunderer','AER','{1}{U}','2','2','1','','Flying£Whenever Skyship Plunderer deals combat damage to a player, for each kind of counter on target permanent or player, give that permanent or player another counter of that kind.','#_Escapes should always be daring._#','Slawomir Maniak',''),
('Sly Requisitioner','AER','{4}{B}','5','2','2','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Whenever a nontoken artifact you control is put into a graveyard from the battlefield, create a 1/1 colorless Servo artifact creature token.','','Dan Scott',''),
('Solemn Recruit','AER','{1}{W}{W}','3','2','2','','Double strike£Revolt — At the beginning of your end step, if a permanent you controlled left the battlefield this turn, put a +1/+1 counter on Solemn Recruit.','#_"I can no longer sit in my workshop and ignore the events outside. My hammers strike for the people of Ghirapur."_#','Eric Deschamps',''),
('Spire of Industry','AER','','0','','','','{T}: Add {C} to your mana pool.£{T}, Pay 1 life: Add one mana of any color to your mana pool. Activate this ability only if you control an artifact.','#_A beacon of prosperity to some, a shadow of oppression to others._#','John Avon','{W}{U}{B}{R}{G}{C}'),
('Spire Patrol','AER','{2}{W}{U}','4','3','2','','Flying£When Spire Patrol enters the battlefield, tap target creature an opponent controls. That creature doesn''t untap during its controller''s next untap step.','#_"After I examine your cargo and check your papers, you can be on your way."_#','Dan Scott',''),
('Sram, Senior Edificer','AER','{1}{W}','2','2','2','','Whenever you cast an Aura, Equipment, or Vehicle spell, draw a card.','#_"As this conflict grows, it gets harder to prevent the city from breaking down. How much longer can we keep this machinery balanced?"_#','Chris Rahn',''),
('Sram''s Expertise','AER','{2}{W}{W}','4','','','','Create three 1/1 colorless Servo artifact creature tokens.£You may cast a card with converted mana cost 3 or less from your hand without paying its mana cost.','#_"It''s important to always have the right tool for the job. This one is for picking my teeth."_#','Kieran Yanner',''),
('Submerged Boneyard','AER','','0','','','','Submerged Boneyard enters the battlefield tapped.£{T}: Add {U} or {B} to your mana pool.','#_Aether currents in the sky mirror water currents below, including the deadly rapids._#','Christine Choi',''),
('Sweatworks Brawler','AER','{3}{R}','4','3','3','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Menace','#_The residents of Embraal were never known for finesse, just for getting things done._#','Zack Stella',''),
('Take into Custody','AER','{U}','1','','','','Tap target creature. It doesn''t untap during its controller''s next untap step.','#_"You can tell me what I want to know, or you can talk to the Chief of Compliance. Why don''t you make it easy on yourself?"_#','David Palumbo',''),
('Tezzeret the Schemer','AER','{2}{U}{B}','4','','','5','+1: Create a colorless artifact token named Etherium Cell with "{T}, Sacrifice this artifact: Add one mana of any color to your mana pool."£−2: Target creature gets +X/-X until end of turn, where X is the number of artifacts you control.£−7: You get an emblem with "At the beginning of combat on your turn, target artifact you control becomes an artifact creature with base power and toughness 5/5."','','Ryan Alexander Lee',''),
('Tezzeret, Master of Metal','AER','{4}{U}{B}','6','','','5','+1: Reveal cards from the top of your library until you reveal an artifact card. Put that card into your hand and the rest on the bottom of your library in a random order.£−3: Target opponent loses life equal to the number of artifacts you control.£−8: Gain control of all artifacts and creatures target opponent controls.','','Tyler Jacobson',''),
('Tezzeret''s Betrayal','AER','{3}{U}{B}','5','','','','Destroy target creature. You may search your library and/or graveyard for a card named Tezzeret, Master of Metal, reveal it, and put it into your hand. If you search your library this way, shuffle it.','#_"You can''t hope to comprehend the plans that are in motion."£—Tezzeret_#','Tyler Jacobson',''),
('Tezzeret''s Simulacrum','AER','{3}','3','2','3','','{T}: Target opponent loses 1 life. If you control a Tezzeret planeswalker, that player loses 3 life instead.','#_Tezzeret''s command of living metal has nothing to do with intricate gearcraft or aether supplies._#','Craig J Spearing',''),
('Tezzeret''s Touch','AER','{1}{U}{B}','3','','','','Enchant artifact£Enchanted artifact is a creature with base power and toughness 5/5 in addition to its other types.£When enchanted artifact is put into a graveyard, return that card to its owner''s hand.','','Chris Rallis',''),
('Thopter Arrest','AER','{2}{W}','3','','','','When Thopter Arrest enters the battlefield, exile target artifact or creature an opponent controls until Thopter Arrest leaves the battlefield.','#_The Consulate''s eyes—unblinking, unsleeping—are everywhere._#','Kieran Yanner',''),
('Tranquil Expanse','AER','','0','','','','Tranquil Expanse enters the battlefield tapped.£{T}: Add {G} or {W} to your mana pool.','#_Beyond the chaos of Ghirapur lies a vibrant world where aether flows through nature._#','Sam Burley',''),
('Treasure Keeper','AER','{4}','4','3','3','','When Treasure Keeper dies, reveal cards from the top of your library until you reveal a nonland card with converted mana cost 3 or less. You may cast that card without paying its mana cost. Put all revealed cards not cast this way on the bottom of your library in a random order.','','James Paick',''),
('Trophy Mage','AER','{2}{U}','3','2','2','','When Trophy Mage enters the battlefield, you may search your library for an artifact card with converted mana cost 3, reveal it, put it into your hand, then shuffle your library.','#_"The tools of the past will help us forge the future."_#','Anna Steinbauer',''),
('Unbridled Growth','AER','{G}','1','','','','Enchant land£Enchanted land has "{T}: Add one mana of any color to your mana pool."£Sacrifice Unbridled Growth: Draw a card.','#_"If the Consulate has abandoned restraint, so too shall the wilds."£—Surash, keeper of the Cowl_#','Ryan Pancoast',''),
('Universal Solvent','AER','{1}','1','','','','{7}, {T}, Sacrifice Universal Solvent: Destroy target permanent.','#_"A few drops of this, and the trickiest problems simply melt away."£—Thamaz, Weldfast inventor_#','Christopher Moeller',''),
('Untethered Express','AER','{4}','4','4','4','','Trample£Whenever Untethered Express attacks, put a +1/+1 counter on it.£Crew 1 #_(Tap any number of creatures you control with total power 1 or more: This Vehicle becomes an artifact creature until end of turn.)_#','#_Rules and rails are made to be broken._#','James Ryman',''),
('Vengeful Rebel','AER','{2}{B}','3','3','2','','Revolt — When Vengeful Rebel enters the battlefield, if a permanent you controlled left the battlefield this turn, target creature an opponent controls gets -3/-3 until end of turn.','#_Some aetherborn joined the rebellion for profit, others for the sake of their freedom, still others for revenge._#','Tomasz Jedruszek',''),
('Verdant Automaton','AER','{2}','2','1','2','','{3}{G}: Put a +1/+1 counter on Verdant Automaton.','#_"A perfect fusion of nature and artifice."£—Irsi, Kujar gardener_#','Ryan Alexander Lee',''),
('Walking Ballista','AER','{X}{X}','0','0','0','','Walking Ballista enters the battlefield with X +1/+1 counters on it.£{4}: Put a +1/+1 counter on Walking Ballista.£Remove a +1/+1 counter from Walking Ballista: It deals 1 damage to target creature or player.','','Daniel Ljunggren',''),
('Watchful Automaton','AER','{3}','3','2','2','','{2}{U}: Scry 1. #_(Look at the top card of your library. You may put that card on the bottom of your library.)_#','#_"Before we can destroy our enemies, we must find them. We must peer into every wretched hovel and every teeming market."£—Baral, Chief of Compliance_#','Eric Deschamps',''),
('Welder Automaton','AER','{2}','2','2','1','','{3}{R}: Welder Automaton deals 1 damage to each opponent.','#_Most of the constructs the renegades used against the Consulate weren''t originally intended for combat. But some didn''t require much modification._#','Victor Adame Minguez',''),
('Weldfast Engineer','AER','{1}{B}{R}','3','3','3','','At the beginning of combat on your turn, target artifact creature you control gets +2/+0 until end of turn.','#_"Let''s err on the side of glorious mayhem."_#','Sara Winters',''),
('Whir of Invention','AER','{X}{U}{U}{U}','3','','','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Search your library for an artifact card with converted mana cost X or less, put it onto the battlefield, then shuffle your library.','','Christine Choi',''),
('Winding Constrictor','AER','{B}{G}','2','2','3','','If one or more counters would be put on an artifact or creature you control, that many plus one of each of those kinds of counters are put on that permanent instead.£If you would get one or more counters, you get that many plus one of each of those kinds of counters instead.','','Izzy',''),
('Wind-Kin Raiders','AER','{4}{U}{U}','6','4','3','','Improvise #_(Your artifacts can help cast this spell. Each artifact you tap after you''re done activating mana abilities pays for {1}.)_#£Flying','#_Small aeronaut societies like the Wind-Kin had little to lose by siding with the renegades, and much to gain._#','Shreya Shetty',''),
('Wrangle','AER','{1}{R}','2','','','','Gain control of target creature with power 4 or less until end of turn. Untap that creature. It gains haste until end of turn.','#_Gremlins are loyal to nothing but their next meal._#','Jason Rainville',''),
('Yahenni, Undying Partisan','AER','{2}{B}','3','2','2','','Haste£Whenever a creature an opponent controls dies, put a +1/+1 counter on Yahenni, Undying Partisan.£Sacrifice another creature: Yahenni gains indestructible until end of turn.','#_"The time for subtlety is over, darling."_#','Lius Lasahido',''),
('Yahenni''s Expertise','AER','{2}{B}{B}','4','','','','All creatures get -3/-3 until end of turn.£You may cast a card with converted mana cost 3 or less from your hand without paying its mana cost.','#_"The Consulate pushed me to my limit, darling, and this is the result."_#','Daarken',''),
('Forest','ZEN','','0','','','','','','Véronique Meignaud','{G}'),
('Forest','ZEN','','0','','','','','','John Avon','{G}'),
('Forest','ZEN','','0','','','','','','Vincent Proce','{G}'),
('Forest','ZEN','','0','','','','','','Vincent Proce','{G}'),
('Forest','ZEN','','0','','','','','','Véronique Meignaud','{G}'),
('Forest','ZEN','','0','','','','','','John Avon','{G}'),
('Forest','ZEN','','0','','','','','','Jung Park','{G}'),
('Island','ZEN','','0','','','','','','Vincent Proce','{U}'),
('Island','ZEN','','0','','','','','','Jung Park','{U}'),
('Island','ZEN','','0','','','','','','John Avon','{U}'),
('Island','ZEN','','0','','','','','','Véronique Meignaud','{U}'),
('Island','ZEN','','0','','','','','','Vincent Proce','{U}'),
('Island','ZEN','','0','','','','','','John Avon','{U}'),
('Island','ZEN','','0','','','','','','Véronique Meignaud','{U}'),
('Mountain','ZEN','','0','','','','','','Vincent Proce','{R}'),
('Mountain','ZEN','','0','','','','','','Véronique Meignaud','{R}'),
('Mountain','ZEN','','0','','','','','','John Avon','{R}'),
('Mountain','ZEN','','0','','','','','','John Avon','{R}'),
('Mountain','ZEN','','0','','','','','','Jung Park','{R}'),
('Mountain','ZEN','','0','','','','','','Véronique Meignaud','{R}'),
('Mountain','ZEN','','0','','','','','','Vincent Proce','{R}'),
('Plains','ZEN','','0','','','','','','Vincent Proce','{W}'),
('Plains','ZEN','','0','','','','','','Vincent Proce','{W}'),
('Plains','ZEN','','0','','','','','','John Avon','{W}'),
('Plains','ZEN','','0','','','','','','Jung Park','{W}'),
('Plains','ZEN','','0','','','','','','Véronique Meignaud','{W}'),
('Plains','ZEN','','0','','','','','','John Avon','{W}'),
('Plains','ZEN','','0','','','','','','Véronique Meignaud','{W}'),
('Swamp','ZEN','','0','','','','','','Véronique Meignaud','{B}'),
('Swamp','ZEN','','0','','','','','','Vincent Proce','{B}'),
('Swamp','ZEN','','0','','','','','','Véronique Meignaud','{B}'),
('Swamp','ZEN','','0','','','','','','John Avon','{B}'),
('Swamp','ZEN','','0','','','','','','Vincent Proce','{B}'),
('Swamp','ZEN','','0','','','','','','John Avon','{B}'),
('Swamp','ZEN','','0','','','','','','Jung Park','{B}');

insert into deckList (deckID, cardID) values (1, 165);
insert into deckList (deckID, cardID) values (1, 132);
insert into deckList (deckID, cardID) values (1, 14);
insert into deckList (deckID, cardID) values (1, 147);
insert into deckList (deckID, cardID) values (1, 151);
insert into deckList (deckID, cardID) values (1, 85);
insert into deckList (deckID, cardID) values (1, 151);
insert into deckList (deckID, cardID) values (1, 35);
insert into deckList (deckID, cardID) values (1, 84);
insert into deckList (deckID, cardID) values (1, 23);
insert into deckList (deckID, cardID) values (1, 19);
insert into deckList (deckID, cardID) values (1, 118);
insert into deckList (deckID, cardID) values (1, 41);
insert into deckList (deckID, cardID) values (1, 26);
insert into deckList (deckID, cardID) values (1, 83);
insert into deckList (deckID, cardID) values (1, 7);
insert into deckList (deckID, cardID) values (1, 47);
insert into deckList (deckID, cardID) values (1, 158);
insert into deckList (deckID, cardID) values (1, 65);
insert into deckList (deckID, cardID) values (1, 4);
insert into deckList (deckID, cardID) values (1, 95);
insert into deckList (deckID, cardID) values (1, 79);
insert into deckList (deckID, cardID) values (1, 92);
insert into deckList (deckID, cardID) values (1, 4);
insert into deckList (deckID, cardID) values (1, 64);
insert into deckList (deckID, cardID) values (1, 148);
insert into deckList (deckID, cardID) values (1, 64);
insert into deckList (deckID, cardID) values (1, 147);
insert into deckList (deckID, cardID) values (1, 91);
insert into deckList (deckID, cardID) values (1, 16);
insert into deckList (deckID, cardID) values (1, 19);
insert into deckList (deckID, cardID) values (1, 101);
insert into deckList (deckID, cardID) values (1, 121);
insert into deckList (deckID, cardID) values (1, 63);
insert into deckList (deckID, cardID) values (1, 122);
insert into deckList (deckID, cardID) values (1, 159);
insert into deckList (deckID, cardID) values (1, 88);
insert into deckList (deckID, cardID) values (1, 98);
insert into deckList (deckID, cardID) values (1, 45);
insert into deckList (deckID, cardID) values (1, 162);
insert into deckList (deckID, cardID) values (1, 129);
insert into deckList (deckID, cardID) values (1, 32);
insert into deckList (deckID, cardID) values (1, 152);
insert into deckList (deckID, cardID) values (1, 77);
insert into deckList (deckID, cardID) values (1, 3);
insert into deckList (deckID, cardID) values (1, 108);
insert into deckList (deckID, cardID) values (1, 134);
insert into deckList (deckID, cardID) values (1, 81);
insert into deckList (deckID, cardID) values (1, 94);
insert into deckList (deckID, cardID) values (1, 150);
insert into deckList (deckID, cardID) values (1, 106);
insert into deckList (deckID, cardID) values (1, 107);
insert into deckList (deckID, cardID) values (1, 134);
insert into deckList (deckID, cardID) values (1, 34);
insert into deckList (deckID, cardID) values (1, 159);
insert into deckList (deckID, cardID) values (1, 107);
insert into deckList (deckID, cardID) values (1, 108);
insert into deckList (deckID, cardID) values (1, 139);
insert into deckList (deckID, cardID) values (1, 24);
insert into deckList (deckID, cardID) values (1, 133);

insert into deckList (deckID, cardID) values (2, 107);
insert into deckList (deckID, cardID) values (2, 3);
insert into deckList (deckID, cardID) values (2, 89);
insert into deckList (deckID, cardID) values (2, 4);
insert into deckList (deckID, cardID) values (2, 137);
insert into deckList (deckID, cardID) values (2, 7);
insert into deckList (deckID, cardID) values (2, 9);
insert into deckList (deckID, cardID) values (2, 83);
insert into deckList (deckID, cardID) values (2, 156);
insert into deckList (deckID, cardID) values (2, 47);
insert into deckList (deckID, cardID) values (2, 150);
insert into deckList (deckID, cardID) values (2, 63);
insert into deckList (deckID, cardID) values (2, 148);
insert into deckList (deckID, cardID) values (2, 159);
insert into deckList (deckID, cardID) values (2, 95);
insert into deckList (deckID, cardID) values (2, 31);
insert into deckList (deckID, cardID) values (2, 74);
insert into deckList (deckID, cardID) values (2, 44);
insert into deckList (deckID, cardID) values (2, 103);
insert into deckList (deckID, cardID) values (2, 107);
insert into deckList (deckID, cardID) values (2, 81);
insert into deckList (deckID, cardID) values (2, 68);
insert into deckList (deckID, cardID) values (2, 25);
insert into deckList (deckID, cardID) values (2, 99);
insert into deckList (deckID, cardID) values (2, 84);
insert into deckList (deckID, cardID) values (2, 91);
insert into deckList (deckID, cardID) values (2, 34);
insert into deckList (deckID, cardID) values (2, 19);
insert into deckList (deckID, cardID) values (2, 80);
insert into deckList (deckID, cardID) values (2, 124);
insert into deckList (deckID, cardID) values (2, 63);
insert into deckList (deckID, cardID) values (2, 57);
insert into deckList (deckID, cardID) values (2, 78);
insert into deckList (deckID, cardID) values (2, 150);
insert into deckList (deckID, cardID) values (2, 87);
insert into deckList (deckID, cardID) values (2, 43);
insert into deckList (deckID, cardID) values (2, 157);
insert into deckList (deckID, cardID) values (2, 131);
insert into deckList (deckID, cardID) values (2, 147);
insert into deckList (deckID, cardID) values (2, 161);
insert into deckList (deckID, cardID) values (2, 88);
insert into deckList (deckID, cardID) values (2, 23);
insert into deckList (deckID, cardID) values (2, 109);
insert into deckList (deckID, cardID) values (2, 149);
insert into deckList (deckID, cardID) values (2, 90);
insert into deckList (deckID, cardID) values (2, 108);
insert into deckList (deckID, cardID) values (2, 63);
insert into deckList (deckID, cardID) values (2, 88);
insert into deckList (deckID, cardID) values (2, 104);
insert into deckList (deckID, cardID) values (2, 94);
insert into deckList (deckID, cardID) values (2, 6);
insert into deckList (deckID, cardID) values (2, 8);
insert into deckList (deckID, cardID) values (2, 98);
insert into deckList (deckID, cardID) values (2, 122);
insert into deckList (deckID, cardID) values (2, 116);
insert into deckList (deckID, cardID) values (2, 51);
insert into deckList (deckID, cardID) values (2, 126);
insert into deckList (deckID, cardID) values (2, 67);
insert into deckList (deckID, cardID) values (2, 139);
insert into deckList (deckID, cardID) values (2, 90);

insert into cardColor (cardID, colorCode) values (1, 'W');
insert into cardColor (cardID, colorCode) values (2, 'B');
insert into cardColor (cardID, colorCode) values (3, 'B');
insert into cardColor (cardID, colorCode) values (4, 'U');
insert into cardColor (cardID, colorCode) values (5, 'G');
insert into cardColor (cardID, colorCode) values (6, 'B');
insert into cardColor (cardID, colorCode) values (7, 'G');
insert into cardColor (cardID, colorCode) values (8, 'C');
insert into cardColor (cardID, colorCode) values (9, 'B');
insert into cardColor (cardID, colorCode) values (10, 'R');
insert into cardColor (cardID, colorCode) values (11, 'G');
insert into cardColor (cardID, colorCode) values (12, 'G');
insert into cardColor (cardID, colorCode) values (13, 'R');
insert into cardColor (cardID, colorCode) values (14, 'W');
insert into cardColor (cardID, colorCode) values (15, 'W');
insert into cardColor (cardID, colorCode) values (16, 'C');
insert into cardColor (cardID, colorCode) values (17, 'B');
insert into cardColor (cardID, colorCode) values (18, 'W');
insert into cardColor (cardID, colorCode) values (19, 'B');
insert into cardColor (cardID, colorCode) values (20, 'W');
insert into cardColor (cardID, colorCode) values (21, 'G');
insert into cardColor (cardID, colorCode) values (22, 'U');
insert into cardColor (cardID, colorCode) values (23, 'B');
insert into cardColor (cardID, colorCode) values (24, 'G');
insert into cardColor (cardID, colorCode) values (25, 'R');
insert into cardColor (cardID, colorCode) values (26, 'G');
insert into cardColor (cardID, colorCode) values (27, 'G');
insert into cardColor (cardID, colorCode) values (28, 'C');
insert into cardColor (cardID, colorCode) values (29, 'G');
insert into cardColor (cardID, colorCode) values (30, 'B');
insert into cardColor (cardID, colorCode) values (31, 'U');
insert into cardColor (cardID, colorCode) values (32, 'W');
insert into cardColor (cardID, colorCode) values (33, 'R');
insert into cardColor (cardID, colorCode) values (34, 'B');
insert into cardColor (cardID, colorCode) values (35, 'G');
insert into cardColor (cardID, colorCode) values (36, 'G');
insert into cardColor (cardID, colorCode) values (37, 'G');
insert into cardColor (cardID, colorCode) values (38, 'C');
insert into cardColor (cardID, colorCode) values (39, 'U');
insert into cardColor (cardID, colorCode) values (40, 'G');
insert into cardColor (cardID, colorCode) values (41, 'B');
insert into cardColor (cardID, colorCode) values (42, 'R');
insert into cardColor (cardID, colorCode) values (43, 'B');
insert into cardColor (cardID, colorCode) values (44, 'B');
insert into cardColor (cardID, colorCode) values (45, 'B');
insert into cardColor (cardID, colorCode) values (46, 'W');
insert into cardColor (cardID, colorCode) values (47, 'B');
insert into cardColor (cardID, colorCode) values (48, 'G');
insert into cardColor (cardID, colorCode) values (49, 'U');
insert into cardColor (cardID, colorCode) values (50, 'B');
insert into cardColor (cardID, colorCode) values (51, 'B');
insert into cardColor (cardID, colorCode) values (52, 'W');
insert into cardColor (cardID, colorCode) values (53, 'C');
insert into cardColor (cardID, colorCode) values (54, 'C');
insert into cardColor (cardID, colorCode) values (55, 'R');
insert into cardColor (cardID, colorCode) values (56, 'W');
insert into cardColor (cardID, colorCode) values (57, 'G');
insert into cardColor (cardID, colorCode) values (58, 'C');
insert into cardColor (cardID, colorCode) values (59, 'U');
insert into cardColor (cardID, colorCode) values (60, 'C');
insert into cardColor (cardID, colorCode) values (61, 'U');
insert into cardColor (cardID, colorCode) values (62, 'B');
insert into cardColor (cardID, colorCode) values (63, 'W');
insert into cardColor (cardID, colorCode) values (64, 'B');
insert into cardColor (cardID, colorCode) values (65, 'G');
insert into cardColor (cardID, colorCode) values (66, 'W');
insert into cardColor (cardID, colorCode) values (67, 'C');
insert into cardColor (cardID, colorCode) values (68, 'B');
insert into cardColor (cardID, colorCode) values (69, 'C');
insert into cardColor (cardID, colorCode) values (70, 'G');
insert into cardColor (cardID, colorCode) values (71, 'C');
insert into cardColor (cardID, colorCode) values (72, 'U');
insert into cardColor (cardID, colorCode) values (73, 'U');
insert into cardColor (cardID, colorCode) values (74, 'C');
insert into cardColor (cardID, colorCode) values (75, 'U');
insert into cardColor (cardID, colorCode) values (76, 'B');
insert into cardColor (cardID, colorCode) values (77, 'R');
insert into cardColor (cardID, colorCode) values (78, 'U');
insert into cardColor (cardID, colorCode) values (79, 'R');
insert into cardColor (cardID, colorCode) values (80, 'G');
insert into cardColor (cardID, colorCode) values (81, 'B');
insert into cardColor (cardID, colorCode) values (82, 'C');
insert into cardColor (cardID, colorCode) values (83, 'C');
insert into cardColor (cardID, colorCode) values (84, 'B');
insert into cardColor (cardID, colorCode) values (85, 'R');
insert into cardColor (cardID, colorCode) values (86, 'C');
insert into cardColor (cardID, colorCode) values (87, 'R');
insert into cardColor (cardID, colorCode) values (88, 'R');
insert into cardColor (cardID, colorCode) values (89, 'W');
insert into cardColor (cardID, colorCode) values (90, 'C');
insert into cardColor (cardID, colorCode) values (91, 'G');
insert into cardColor (cardID, colorCode) values (92, 'G');
insert into cardColor (cardID, colorCode) values (93, 'G');
insert into cardColor (cardID, colorCode) values (94, 'R');
insert into cardColor (cardID, colorCode) values (95, 'C');
insert into cardColor (cardID, colorCode) values (96, 'C');
insert into cardColor (cardID, colorCode) values (97, 'R');
insert into cardColor (cardID, colorCode) values (98, 'R');
insert into cardColor (cardID, colorCode) values (99, 'B');
insert into cardColor (cardID, colorCode) values (100, 'W');
insert into cardColor (cardID, colorCode) values (101, 'B');
insert into cardColor (cardID, colorCode) values (102, 'U');
insert into cardColor (cardID, colorCode) values (103, 'W');
insert into cardColor (cardID, colorCode) values (104, 'C');
insert into cardColor (cardID, colorCode) values (105, 'G');
insert into cardColor (cardID, colorCode) values (106, 'R');
insert into cardColor (cardID, colorCode) values (107, 'C');
insert into cardColor (cardID, colorCode) values (108, 'R');
insert into cardColor (cardID, colorCode) values (109, 'U');
insert into cardColor (cardID, colorCode) values (110, 'U');
insert into cardColor (cardID, colorCode) values (111, 'U');
insert into cardColor (cardID, colorCode) values (112, 'R');
insert into cardColor (cardID, colorCode) values (113, 'W');
insert into cardColor (cardID, colorCode) values (114, 'C');
insert into cardColor (cardID, colorCode) values (115, 'W');
insert into cardColor (cardID, colorCode) values (116, 'C');
insert into cardColor (cardID, colorCode) values (117, 'C');
insert into cardColor (cardID, colorCode) values (118, 'C');
insert into cardColor (cardID, colorCode) values (119, 'G');
insert into cardColor (cardID, colorCode) values (120, 'R');
insert into cardColor (cardID, colorCode) values (121, 'B');
insert into cardColor (cardID, colorCode) values (122, 'U');
insert into cardColor (cardID, colorCode) values (123, 'C');
insert into cardColor (cardID, colorCode) values (124, 'R');
insert into cardColor (cardID, colorCode) values (125, 'R');
insert into cardColor (cardID, colorCode) values (126, 'C');
insert into cardColor (cardID, colorCode) values (127, 'R');
insert into cardColor (cardID, colorCode) values (128, 'G');
insert into cardColor (cardID, colorCode) values (129, 'B');
insert into cardColor (cardID, colorCode) values (130, 'B');
insert into cardColor (cardID, colorCode) values (1, 'R');
insert into cardColor (cardID, colorCode) values (2, 'C');
insert into cardColor (cardID, colorCode) values (3, 'R');
insert into cardColor (cardID, colorCode) values (4, 'B');
insert into cardColor (cardID, colorCode) values (5, 'C');
insert into cardColor (cardID, colorCode) values (6, 'U');
insert into cardColor (cardID, colorCode) values (7, 'U');
insert into cardColor (cardID, colorCode) values (8, 'W');
insert into cardColor (cardID, colorCode) values (9, 'G');
insert into cardColor (cardID, colorCode) values (10, 'U');
insert into cardColor (cardID, colorCode) values (11, 'W');
insert into cardColor (cardID, colorCode) values (12, 'B');
insert into cardColor (cardID, colorCode) values (13, 'B');
insert into cardColor (cardID, colorCode) values (14, 'W');
insert into cardColor (cardID, colorCode) values (15, 'R');
insert into cardColor (cardID, colorCode) values (16, 'R');
insert into cardColor (cardID, colorCode) values (17, 'R');
insert into cardColor (cardID, colorCode) values (18, 'C');
insert into cardColor (cardID, colorCode) values (19, 'B');
insert into cardColor (cardID, colorCode) values (20, 'G');
insert into cardColor (cardID, colorCode) values (21, 'C');
insert into cardColor (cardID, colorCode) values (22, 'C');
insert into cardColor (cardID, colorCode) values (23, 'C');
insert into cardColor (cardID, colorCode) values (24, 'G');
insert into cardColor (cardID, colorCode) values (25, 'U');
insert into cardColor (cardID, colorCode) values (26, 'G');
insert into cardColor (cardID, colorCode) values (27, 'W');
insert into cardColor (cardID, colorCode) values (28, 'G');
insert into cardColor (cardID, colorCode) values (29, 'W');
insert into cardColor (cardID, colorCode) values (30, 'G');
insert into cardColor (cardID, colorCode) values (31, 'W');
insert into cardColor (cardID, colorCode) values (32, 'C');
insert into cardColor (cardID, colorCode) values (33, 'B');
insert into cardColor (cardID, colorCode) values (34, 'R');
insert into cardColor (cardID, colorCode) values (35, 'W');
insert into cardColor (cardID, colorCode) values (36, 'R');
insert into cardColor (cardID, colorCode) values (37, 'R');
insert into cardColor (cardID, colorCode) values (38, 'B');
insert into cardColor (cardID, colorCode) values (39, 'G');
insert into cardColor (cardID, colorCode) values (40, 'C');
insert into cardColor (cardID, colorCode) values (41, 'U');
insert into cardColor (cardID, colorCode) values (42, 'W');
insert into cardColor (cardID, colorCode) values (43, 'W');
insert into cardColor (cardID, colorCode) values (44, 'G');
insert into cardColor (cardID, colorCode) values (45, 'B');
insert into cardColor (cardID, colorCode) values (46, 'B');
insert into cardColor (cardID, colorCode) values (47, 'U');
insert into cardColor (cardID, colorCode) values (48, 'W');
insert into cardColor (cardID, colorCode) values (49, 'C');
insert into cardColor (cardID, colorCode) values (50, 'W');
insert into cardColor (cardID, colorCode) values (51, 'U');
insert into cardColor (cardID, colorCode) values (52, 'R');
insert into cardColor (cardID, colorCode) values (53, 'R');
insert into cardColor (cardID, colorCode) values (54, 'C');
insert into cardColor (cardID, colorCode) values (55, 'B');
insert into cardColor (cardID, colorCode) values (56, 'B');
insert into cardColor (cardID, colorCode) values (57, 'R');
insert into cardColor (cardID, colorCode) values (58, 'G');
insert into cardColor (cardID, colorCode) values (59, 'G');
insert into cardColor (cardID, colorCode) values (60, 'B');
insert into cardColor (cardID, colorCode) values (61, 'G');
insert into cardColor (cardID, colorCode) values (62, 'G');
insert into cardColor (cardID, colorCode) values (63, 'C');
insert into cardColor (cardID, colorCode) values (64, 'B');
insert into cardColor (cardID, colorCode) values (65, 'G');
insert into cardColor (cardID, colorCode) values (66, 'U');
insert into cardColor (cardID, colorCode) values (67, 'R');
insert into cardColor (cardID, colorCode) values (68, 'R');
insert into cardColor (cardID, colorCode) values (69, 'R');
insert into cardColor (cardID, colorCode) values (70, 'R');
insert into cardColor (cardID, colorCode) values (71, 'C');
insert into cardColor (cardID, colorCode) values (72, 'C');
insert into cardColor (cardID, colorCode) values (73, 'W');
insert into cardColor (cardID, colorCode) values (74, 'B');
insert into cardColor (cardID, colorCode) values (75, 'W');
insert into cardColor (cardID, colorCode) values (76, 'W');
insert into cardColor (cardID, colorCode) values (77, 'R');
insert into cardColor (cardID, colorCode) values (78, 'W');
insert into cardColor (cardID, colorCode) values (79, 'C');
insert into cardColor (cardID, colorCode) values (80, 'G');
insert into cardColor (cardID, colorCode) values (81, 'U');
insert into cardColor (cardID, colorCode) values (82, 'G');
insert into cardColor (cardID, colorCode) values (83, 'C');
insert into cardColor (cardID, colorCode) values (84, 'U');
insert into cardColor (cardID, colorCode) values (85, 'U');
insert into cardColor (cardID, colorCode) values (86, 'R');
insert into cardColor (cardID, colorCode) values (87, 'U');
insert into cardColor (cardID, colorCode) values (88, 'B');
insert into cardColor (cardID, colorCode) values (89, 'U');
insert into cardColor (cardID, colorCode) values (90, 'U');
insert into cardColor (cardID, colorCode) values (91, 'G');
insert into cardColor (cardID, colorCode) values (92, 'U');
insert into cardColor (cardID, colorCode) values (93, 'G');
insert into cardColor (cardID, colorCode) values (94, 'B');
insert into cardColor (cardID, colorCode) values (95, 'G');
insert into cardColor (cardID, colorCode) values (96, 'R');
insert into cardColor (cardID, colorCode) values (97, 'G');
insert into cardColor (cardID, colorCode) values (98, 'C');
insert into cardColor (cardID, colorCode) values (99, 'G');
insert into cardColor (cardID, colorCode) values (100, 'W');
insert into cardColor (cardID, colorCode) values (101, 'U');
insert into cardColor (cardID, colorCode) values (102, 'R');
insert into cardColor (cardID, colorCode) values (103, 'B');
insert into cardColor (cardID, colorCode) values (104, 'W');
insert into cardColor (cardID, colorCode) values (105, 'G');
insert into cardColor (cardID, colorCode) values (106, 'G');
insert into cardColor (cardID, colorCode) values (107, 'B');
insert into cardColor (cardID, colorCode) values (108, 'G');
insert into cardColor (cardID, colorCode) values (109, 'R');
insert into cardColor (cardID, colorCode) values (110, 'B');
insert into cardColor (cardID, colorCode) values (111, 'R');
insert into cardColor (cardID, colorCode) values (112, 'C')
insert into cardColor (cardID, colorCode) values (113, 'B');
insert into cardColor (cardID, colorCode) values (114, 'W');
insert into cardColor (cardID, colorCode) values (115, 'U');
insert into cardColor (cardID, colorCode) values (116, 'U');
insert into cardColor (cardID, colorCode) values (117, 'B');
insert into cardColor (cardID, colorCode) values (118, 'B');
insert into cardColor (cardID, colorCode) values (119, 'W');
insert into cardColor (cardID, colorCode) values (120, 'R');
insert into cardColor (cardID, colorCode) values (121, 'U');
insert into cardColor (cardID, colorCode) values (122, 'G');
insert into cardColor (cardID, colorCode) values (123, 'C');
insert into cardColor (cardID, colorCode) values (124, 'U');
insert into cardColor (cardID, colorCode) values (125, 'W');
insert into cardColor (cardID, colorCode) values (126, 'C');
insert into cardColor (cardID, colorCode) values (127, 'U');
insert into cardColor (cardID, colorCode) values (128, 'U');
insert into cardColor (cardID, colorCode) values (129, 'R');
insert into cardColor (cardID, colorCode) values (130, 'U');

insert into cardColor (cardID, colorCode) values (131, 'C');
insert into cardColor (cardID, colorCode) values (132, 'C');
insert into cardColor (cardID, colorCode) values (133, 'C');
insert into cardColor (cardID, colorCode) values (134, 'C');
insert into cardColor (cardID, colorCode) values (135, 'C');
insert into cardColor (cardID, colorCode) values (136, 'C');
insert into cardColor (cardID, colorCode) values (137, 'C');
insert into cardColor (cardID, colorCode) values (138, 'C');
insert into cardColor (cardID, colorCode) values (139, 'C');
insert into cardColor (cardID, colorCode) values (140, 'C');
insert into cardColor (cardID, colorCode) values (141, 'C');
insert into cardColor (cardID, colorCode) values (142, 'C');
insert into cardColor (cardID, colorCode) values (143, 'C');
insert into cardColor (cardID, colorCode) values (144, 'C');
insert into cardColor (cardID, colorCode) values (145, 'C');
insert into cardColor (cardID, colorCode) values (146, 'C');
insert into cardColor (cardID, colorCode) values (147, 'C');
insert into cardColor (cardID, colorCode) values (148, 'C');
insert into cardColor (cardID, colorCode) values (149, 'C');
insert into cardColor (cardID, colorCode) values (150, 'C');
insert into cardColor (cardID, colorCode) values (151, 'C');
insert into cardColor (cardID, colorCode) values (152, 'C');
insert into cardColor (cardID, colorCode) values (153, 'C');
insert into cardColor (cardID, colorCode) values (154, 'C');
insert into cardColor (cardID, colorCode) values (155, 'C');
insert into cardColor (cardID, colorCode) values (156, 'C');
insert into cardColor (cardID, colorCode) values (157, 'C');
insert into cardColor (cardID, colorCode) values (158, 'C');
insert into cardColor (cardID, colorCode) values (159, 'C');
insert into cardColor (cardID, colorCode) values (160, 'C');
insert into cardColor (cardID, colorCode) values (161, 'C');
insert into cardColor (cardID, colorCode) values (162, 'C');
insert into cardColor (cardID, colorCode) values (163, 'C');
insert into cardColor (cardID, colorCode) values (164, 'C');
insert into cardColor (cardID, colorCode) values (165, 'C');

insert into cardColorIdentity (cardID, colorCode) values (1, 'W');
insert into cardColorIdentity (cardID, colorCode) values (2, 'B');
insert into cardColorIdentity (cardID, colorCode) values (3, 'B');
insert into cardColorIdentity (cardID, colorCode) values (4, 'U');
insert into cardColorIdentity (cardID, colorCode) values (5, 'G');
insert into cardColorIdentity (cardID, colorCode) values (6, 'B');
insert into cardColorIdentity (cardID, colorCode) values (7, 'G');
insert into cardColorIdentity (cardID, colorCode) values (8, 'C');
insert into cardColorIdentity (cardID, colorCode) values (9, 'B');
insert into cardColorIdentity (cardID, colorCode) values (10, 'R');
insert into cardColorIdentity (cardID, colorCode) values (11, 'G');
insert into cardColorIdentity (cardID, colorCode) values (12, 'G');
insert into cardColorIdentity (cardID, colorCode) values (13, 'R');
insert into cardColorIdentity (cardID, colorCode) values (14, 'W');
insert into cardColorIdentity (cardID, colorCode) values (15, 'W');
insert into cardColorIdentity (cardID, colorCode) values (16, 'C');
insert into cardColorIdentity (cardID, colorCode) values (17, 'B');
insert into cardColorIdentity (cardID, colorCode) values (18, 'W');
insert into cardColorIdentity (cardID, colorCode) values (19, 'B');
insert into cardColorIdentity (cardID, colorCode) values (20, 'W');
insert into cardColorIdentity (cardID, colorCode) values (21, 'G');
insert into cardColorIdentity (cardID, colorCode) values (22, 'U');
insert into cardColorIdentity (cardID, colorCode) values (23, 'B');
insert into cardColorIdentity (cardID, colorCode) values (24, 'G');
insert into cardColorIdentity (cardID, colorCode) values (25, 'R');
insert into cardColorIdentity (cardID, colorCode) values (26, 'G');
insert into cardColorIdentity (cardID, colorCode) values (27, 'G');
insert into cardColorIdentity (cardID, colorCode) values (28, 'C');
insert into cardColorIdentity (cardID, colorCode) values (29, 'G');
insert into cardColorIdentity (cardID, colorCode) values (30, 'B');
insert into cardColorIdentity (cardID, colorCode) values (31, 'U');
insert into cardColorIdentity (cardID, colorCode) values (32, 'W');
insert into cardColorIdentity (cardID, colorCode) values (33, 'R');
insert into cardColorIdentity (cardID, colorCode) values (34, 'B');
insert into cardColorIdentity (cardID, colorCode) values (35, 'G');
insert into cardColorIdentity (cardID, colorCode) values (36, 'G');
insert into cardColorIdentity (cardID, colorCode) values (37, 'G');
insert into cardColorIdentity (cardID, colorCode) values (38, 'C');
insert into cardColorIdentity (cardID, colorCode) values (39, 'U');
insert into cardColorIdentity (cardID, colorCode) values (40, 'G');
insert into cardColorIdentity (cardID, colorCode) values (41, 'B');
insert into cardColorIdentity (cardID, colorCode) values (42, 'R');
insert into cardColorIdentity (cardID, colorCode) values (43, 'B');
insert into cardColorIdentity (cardID, colorCode) values (44, 'B');
insert into cardColorIdentity (cardID, colorCode) values (45, 'B');
insert into cardColorIdentity (cardID, colorCode) values (46, 'W');
insert into cardColorIdentity (cardID, colorCode) values (47, 'B');
insert into cardColorIdentity (cardID, colorCode) values (48, 'G');
insert into cardColorIdentity (cardID, colorCode) values (49, 'U');
insert into cardColorIdentity (cardID, colorCode) values (50, 'B');
insert into cardColorIdentity (cardID, colorCode) values (51, 'B');
insert into cardColorIdentity (cardID, colorCode) values (52, 'W');
insert into cardColorIdentity (cardID, colorCode) values (53, 'C');
insert into cardColorIdentity (cardID, colorCode) values (54, 'C');
insert into cardColorIdentity (cardID, colorCode) values (55, 'R');
insert into cardColorIdentity (cardID, colorCode) values (56, 'W');
insert into cardColorIdentity (cardID, colorCode) values (57, 'G');
insert into cardColorIdentity (cardID, colorCode) values (58, 'C');
insert into cardColorIdentity (cardID, colorCode) values (59, 'U');
insert into cardColorIdentity (cardID, colorCode) values (60, 'C');
insert into cardColorIdentity (cardID, colorCode) values (61, 'U');
insert into cardColorIdentity (cardID, colorCode) values (62, 'B');
insert into cardColorIdentity (cardID, colorCode) values (63, 'W');
insert into cardColorIdentity (cardID, colorCode) values (64, 'B');
insert into cardColorIdentity (cardID, colorCode) values (65, 'G');
insert into cardColorIdentity (cardID, colorCode) values (66, 'W');
insert into cardColorIdentity (cardID, colorCode) values (67, 'C');
insert into cardColorIdentity (cardID, colorCode) values (68, 'B');
insert into cardColorIdentity (cardID, colorCode) values (69, 'C');
insert into cardColorIdentity (cardID, colorCode) values (70, 'G');
insert into cardColorIdentity (cardID, colorCode) values (71, 'C');
insert into cardColorIdentity (cardID, colorCode) values (72, 'U');
insert into cardColorIdentity (cardID, colorCode) values (73, 'U');
insert into cardColorIdentity (cardID, colorCode) values (74, 'C');
insert into cardColorIdentity (cardID, colorCode) values (75, 'U');
insert into cardColorIdentity (cardID, colorCode) values (76, 'B');
insert into cardColorIdentity (cardID, colorCode) values (77, 'R');
insert into cardColorIdentity (cardID, colorCode) values (78, 'U');
insert into cardColorIdentity (cardID, colorCode) values (79, 'R');
insert into cardColorIdentity (cardID, colorCode) values (80, 'G');
insert into cardColorIdentity (cardID, colorCode) values (81, 'B');
insert into cardColorIdentity (cardID, colorCode) values (82, 'C');
insert into cardColorIdentity (cardID, colorCode) values (83, 'C');
insert into cardColorIdentity (cardID, colorCode) values (84, 'B');
insert into cardColorIdentity (cardID, colorCode) values (85, 'R');
insert into cardColorIdentity (cardID, colorCode) values (86, 'C');
insert into cardColorIdentity (cardID, colorCode) values (87, 'R');
insert into cardColorIdentity (cardID, colorCode) values (88, 'R');
insert into cardColorIdentity (cardID, colorCode) values (89, 'W');
insert into cardColorIdentity (cardID, colorCode) values (90, 'C');
insert into cardColorIdentity (cardID, colorCode) values (91, 'G');
insert into cardColorIdentity (cardID, colorCode) values (92, 'G');
insert into cardColorIdentity (cardID, colorCode) values (93, 'G');
insert into cardColorIdentity (cardID, colorCode) values (94, 'R');
insert into cardColorIdentity (cardID, colorCode) values (95, 'C');
insert into cardColorIdentity (cardID, colorCode) values (96, 'C');
insert into cardColorIdentity (cardID, colorCode) values (97, 'R');
insert into cardColorIdentity (cardID, colorCode) values (98, 'R');
insert into cardColorIdentity (cardID, colorCode) values (99, 'B');
insert into cardColorIdentity (cardID, colorCode) values (100, 'W');
insert into cardColorIdentity (cardID, colorCode) values (101, 'B');
insert into cardColorIdentity (cardID, colorCode) values (102, 'U');
insert into cardColorIdentity (cardID, colorCode) values (103, 'W');
insert into cardColorIdentity (cardID, colorCode) values (104, 'C');
insert into cardColorIdentity (cardID, colorCode) values (105, 'G');
insert into cardColorIdentity (cardID, colorCode) values (106, 'R');
insert into cardColorIdentity (cardID, colorCode) values (107, 'C');
insert into cardColorIdentity (cardID, colorCode) values (108, 'R');
insert into cardColorIdentity (cardID, colorCode) values (109, 'U');
insert into cardColorIdentity (cardID, colorCode) values (110, 'U');
insert into cardColorIdentity (cardID, colorCode) values (111, 'U');
insert into cardColorIdentity (cardID, colorCode) values (112, 'R');
insert into cardColorIdentity (cardID, colorCode) values (113, 'W');
insert into cardColorIdentity (cardID, colorCode) values (114, 'C');
insert into cardColorIdentity (cardID, colorCode) values (115, 'W');
insert into cardColorIdentity (cardID, colorCode) values (116, 'C');
insert into cardColorIdentity (cardID, colorCode) values (117, 'C');
insert into cardColorIdentity (cardID, colorCode) values (118, 'C');
insert into cardColorIdentity (cardID, colorCode) values (119, 'G');
insert into cardColorIdentity (cardID, colorCode) values (120, 'R');
insert into cardColorIdentity (cardID, colorCode) values (121, 'B');
insert into cardColorIdentity (cardID, colorCode) values (122, 'U');
insert into cardColorIdentity (cardID, colorCode) values (123, 'C');
insert into cardColorIdentity (cardID, colorCode) values (124, 'R');
insert into cardColorIdentity (cardID, colorCode) values (125, 'R');
insert into cardColorIdentity (cardID, colorCode) values (126, 'C');
insert into cardColorIdentity (cardID, colorCode) values (127, 'R');
insert into cardColorIdentity (cardID, colorCode) values (128, 'G');
insert into cardColorIdentity (cardID, colorCode) values (129, 'B');
insert into cardColorIdentity (cardID, colorCode) values (130, 'B');
insert into cardColorIdentity (cardID, colorCode) values (1, 'R');
insert into cardColorIdentity (cardID, colorCode) values (2, 'C');
insert into cardColorIdentity (cardID, colorCode) values (3, 'R');
insert into cardColorIdentity (cardID, colorCode) values (4, 'B');
insert into cardColorIdentity (cardID, colorCode) values (5, 'C');
insert into cardColorIdentity (cardID, colorCode) values (6, 'U');
insert into cardColorIdentity (cardID, colorCode) values (7, 'U');
insert into cardColorIdentity (cardID, colorCode) values (8, 'W');
insert into cardColorIdentity (cardID, colorCode) values (9, 'G');
insert into cardColorIdentity (cardID, colorCode) values (10, 'U');
insert into cardColorIdentity (cardID, colorCode) values (11, 'W');
insert into cardColorIdentity (cardID, colorCode) values (12, 'B');
insert into cardColorIdentity (cardID, colorCode) values (13, 'B');
insert into cardColorIdentity (cardID, colorCode) values (14, 'W');
insert into cardColorIdentity (cardID, colorCode) values (15, 'R');
insert into cardColorIdentity (cardID, colorCode) values (16, 'R');
insert into cardColorIdentity (cardID, colorCode) values (17, 'R');
insert into cardColorIdentity (cardID, colorCode) values (18, 'C');
insert into cardColorIdentity (cardID, colorCode) values (19, 'B');
insert into cardColorIdentity (cardID, colorCode) values (20, 'G');
insert into cardColorIdentity (cardID, colorCode) values (21, 'C');
insert into cardColorIdentity (cardID, colorCode) values (22, 'C');
insert into cardColorIdentity (cardID, colorCode) values (23, 'C');
insert into cardColorIdentity (cardID, colorCode) values (24, 'G');
insert into cardColorIdentity (cardID, colorCode) values (25, 'U');
insert into cardColorIdentity (cardID, colorCode) values (26, 'G');
insert into cardColorIdentity (cardID, colorCode) values (27, 'W');
insert into cardColorIdentity (cardID, colorCode) values (28, 'G');
insert into cardColorIdentity (cardID, colorCode) values (29, 'W');
insert into cardColorIdentity (cardID, colorCode) values (30, 'G');
insert into cardColorIdentity (cardID, colorCode) values (31, 'W');
insert into cardColorIdentity (cardID, colorCode) values (32, 'C');
insert into cardColorIdentity (cardID, colorCode) values (33, 'B');
insert into cardColorIdentity (cardID, colorCode) values (34, 'R');
insert into cardColorIdentity (cardID, colorCode) values (35, 'W');
insert into cardColorIdentity (cardID, colorCode) values (36, 'R');
insert into cardColorIdentity (cardID, colorCode) values (37, 'R');
insert into cardColorIdentity (cardID, colorCode) values (38, 'B');
insert into cardColorIdentity (cardID, colorCode) values (39, 'G');
insert into cardColorIdentity (cardID, colorCode) values (40, 'C');
insert into cardColorIdentity (cardID, colorCode) values (41, 'U');
insert into cardColorIdentity (cardID, colorCode) values (42, 'W');
insert into cardColorIdentity (cardID, colorCode) values (43, 'W');
insert into cardColorIdentity (cardID, colorCode) values (44, 'G');
insert into cardColorIdentity (cardID, colorCode) values (45, 'B');
insert into cardColorIdentity (cardID, colorCode) values (46, 'B');
insert into cardColorIdentity (cardID, colorCode) values (47, 'U');
insert into cardColorIdentity (cardID, colorCode) values (48, 'W');
insert into cardColorIdentity (cardID, colorCode) values (49, 'C');
insert into cardColorIdentity (cardID, colorCode) values (50, 'W');
insert into cardColorIdentity (cardID, colorCode) values (51, 'U');
insert into cardColorIdentity (cardID, colorCode) values (52, 'R');
insert into cardColorIdentity (cardID, colorCode) values (53, 'R');
insert into cardColorIdentity (cardID, colorCode) values (54, 'C');
insert into cardColorIdentity (cardID, colorCode) values (55, 'B');
insert into cardColorIdentity (cardID, colorCode) values (56, 'B');
insert into cardColorIdentity (cardID, colorCode) values (57, 'R');
insert into cardColorIdentity (cardID, colorCode) values (58, 'G');
insert into cardColorIdentity (cardID, colorCode) values (59, 'G');
insert into cardColorIdentity (cardID, colorCode) values (60, 'B');
insert into cardColorIdentity (cardID, colorCode) values (61, 'G');
insert into cardColorIdentity (cardID, colorCode) values (62, 'G');
insert into cardColorIdentity (cardID, colorCode) values (63, 'C');
insert into cardColorIdentity (cardID, colorCode) values (64, 'B');
insert into cardColorIdentity (cardID, colorCode) values (65, 'G');
insert into cardColorIdentity (cardID, colorCode) values (66, 'U');
insert into cardColorIdentity (cardID, colorCode) values (67, 'R');
insert into cardColorIdentity (cardID, colorCode) values (68, 'R');
insert into cardColorIdentity (cardID, colorCode) values (69, 'R');
insert into cardColorIdentity (cardID, colorCode) values (70, 'R');
insert into cardColorIdentity (cardID, colorCode) values (71, 'C');
insert into cardColorIdentity (cardID, colorCode) values (72, 'C');
insert into cardColorIdentity (cardID, colorCode) values (73, 'W');
insert into cardColorIdentity (cardID, colorCode) values (74, 'B');
insert into cardColorIdentity (cardID, colorCode) values (75, 'W');
insert into cardColorIdentity (cardID, colorCode) values (76, 'W');
insert into cardColorIdentity (cardID, colorCode) values (77, 'R');
insert into cardColorIdentity (cardID, colorCode) values (78, 'W');
insert into cardColorIdentity (cardID, colorCode) values (79, 'C');
insert into cardColorIdentity (cardID, colorCode) values (80, 'G');
insert into cardColorIdentity (cardID, colorCode) values (81, 'U');
insert into cardColorIdentity (cardID, colorCode) values (82, 'G');
insert into cardColorIdentity (cardID, colorCode) values (83, 'C');
insert into cardColorIdentity (cardID, colorCode) values (84, 'U');
insert into cardColorIdentity (cardID, colorCode) values (85, 'U');
insert into cardColorIdentity (cardID, colorCode) values (86, 'R');
insert into cardColorIdentity (cardID, colorCode) values (87, 'U');
insert into cardColorIdentity (cardID, colorCode) values (88, 'B');
insert into cardColorIdentity (cardID, colorCode) values (89, 'U');
insert into cardColorIdentity (cardID, colorCode) values (90, 'U');
insert into cardColorIdentity (cardID, colorCode) values (91, 'G');
insert into cardColorIdentity (cardID, colorCode) values (92, 'U');
insert into cardColorIdentity (cardID, colorCode) values (93, 'G');
insert into cardColorIdentity (cardID, colorCode) values (94, 'B');
insert into cardColorIdentity (cardID, colorCode) values (95, 'G');
insert into cardColorIdentity (cardID, colorCode) values (96, 'R');
insert into cardColorIdentity (cardID, colorCode) values (97, 'G');
insert into cardColorIdentity (cardID, colorCode) values (98, 'C');
insert into cardColorIdentity (cardID, colorCode) values (99, 'G');
insert into cardColorIdentity (cardID, colorCode) values (100, 'W');
insert into cardColorIdentity (cardID, colorCode) values (101, 'U');
insert into cardColorIdentity (cardID, colorCode) values (102, 'R');
insert into cardColorIdentity (cardID, colorCode) values (103, 'B');
insert into cardColorIdentity (cardID, colorCode) values (104, 'W');
insert into cardColorIdentity (cardID, colorCode) values (105, 'G');
insert into cardColorIdentity (cardID, colorCode) values (106, 'G');
insert into cardColorIdentity (cardID, colorCode) values (107, 'B');
insert into cardColorIdentity (cardID, colorCode) values (108, 'G');
insert into cardColorIdentity (cardID, colorCode) values (109, 'R');
insert into cardColorIdentity (cardID, colorCode) values (110, 'B');
insert into cardColorIdentity (cardID, colorCode) values (111, 'R');
insert into cardColorIdentity (cardID, colorCode) values (112, 'C')
insert into cardColorIdentity (cardID, colorCode) values (113, 'B');
insert into cardColorIdentity (cardID, colorCode) values (114, 'W');
insert into cardColorIdentity (cardID, colorCode) values (115, 'U');
insert into cardColorIdentity (cardID, colorCode) values (116, 'U');
insert into cardColorIdentity (cardID, colorCode) values (117, 'B');
insert into cardColorIdentity (cardID, colorCode) values (118, 'B');
insert into cardColorIdentity (cardID, colorCode) values (119, 'W');
insert into cardColorIdentity (cardID, colorCode) values (120, 'R');
insert into cardColorIdentity (cardID, colorCode) values (121, 'U');
insert into cardColorIdentity (cardID, colorCode) values (122, 'G');
insert into cardColorIdentity (cardID, colorCode) values (123, 'C');
insert into cardColorIdentity (cardID, colorCode) values (124, 'U');
insert into cardColorIdentity (cardID, colorCode) values (125, 'W');
insert into cardColorIdentity (cardID, colorCode) values (126, 'C');
insert into cardColorIdentity (cardID, colorCode) values (127, 'U');
insert into cardColorIdentity (cardID, colorCode) values (128, 'U');
insert into cardColorIdentity (cardID, colorCode) values (129, 'R');
insert into cardColorIdentity (cardID, colorCode) values (130, 'U');

insert into cardColorIdentity (cardID, colorCode) values (131, 'G');
insert into cardColorIdentity (cardID, colorCode) values (132, 'G');
insert into cardColorIdentity (cardID, colorCode) values (133, 'G');
insert into cardColorIdentity (cardID, colorCode) values (134, 'G');
insert into cardColorIdentity (cardID, colorCode) values (135, 'G');
insert into cardColorIdentity (cardID, colorCode) values (136, 'G');
insert into cardColorIdentity (cardID, colorCode) values (137, 'G');
insert into cardColorIdentity (cardID, colorCode) values (138, 'U');
insert into cardColorIdentity (cardID, colorCode) values (139, 'U');
insert into cardColorIdentity (cardID, colorCode) values (140, 'U');
insert into cardColorIdentity (cardID, colorCode) values (141, 'U');
insert into cardColorIdentity (cardID, colorCode) values (142, 'U');
insert into cardColorIdentity (cardID, colorCode) values (143, 'U');
insert into cardColorIdentity (cardID, colorCode) values (144, 'U');
insert into cardColorIdentity (cardID, colorCode) values (145, 'R');
insert into cardColorIdentity (cardID, colorCode) values (146, 'R');
insert into cardColorIdentity (cardID, colorCode) values (147, 'R');
insert into cardColorIdentity (cardID, colorCode) values (148, 'R');
insert into cardColorIdentity (cardID, colorCode) values (149, 'R');
insert into cardColorIdentity (cardID, colorCode) values (150, 'R');
insert into cardColorIdentity (cardID, colorCode) values (151, 'R');
insert into cardColorIdentity (cardID, colorCode) values (152, 'W');
insert into cardColorIdentity (cardID, colorCode) values (153, 'W');
insert into cardColorIdentity (cardID, colorCode) values (154, 'W');
insert into cardColorIdentity (cardID, colorCode) values (155, 'W');
insert into cardColorIdentity (cardID, colorCode) values (156, 'W');
insert into cardColorIdentity (cardID, colorCode) values (157, 'W');
insert into cardColorIdentity (cardID, colorCode) values (158, 'W');
insert into cardColorIdentity (cardID, colorCode) values (159, 'B');
insert into cardColorIdentity (cardID, colorCode) values (160, 'B');
insert into cardColorIdentity (cardID, colorCode) values (161, 'B');
insert into cardColorIdentity (cardID, colorCode) values (162, 'B');
insert into cardColorIdentity (cardID, colorCode) values (163, 'B');
insert into cardColorIdentity (cardID, colorCode) values (164, 'B');
insert into cardColorIdentity (cardID, colorCode) values (165, 'B');

--card types

--basic lands

--basic
insert into cardTypeCard (cardID, cardType) values (131, 1);
insert into cardTypeCard (cardID, cardType) values (132, 1);
insert into cardTypeCard (cardID, cardType) values (133, 1);
insert into cardTypeCard (cardID, cardType) values (134, 1);
insert into cardTypeCard (cardID, cardType) values (135, 1);
insert into cardTypeCard (cardID, cardType) values (136, 1);
insert into cardTypeCard (cardID, cardType) values (137, 1);
insert into cardTypeCard (cardID, cardType) values (138, 1);
insert into cardTypeCard (cardID, cardType) values (139, 1);
insert into cardTypeCard (cardID, cardType) values (140, 1);
insert into cardTypeCard (cardID, cardType) values (141, 1);
insert into cardTypeCard (cardID, cardType) values (142, 1);
insert into cardTypeCard (cardID, cardType) values (143, 1);
insert into cardTypeCard (cardID, cardType) values (144, 1);
insert into cardTypeCard (cardID, cardType) values (145, 1);
insert into cardTypeCard (cardID, cardType) values (146, 1);
insert into cardTypeCard (cardID, cardType) values (147, 1);
insert into cardTypeCard (cardID, cardType) values (148, 1);
insert into cardTypeCard (cardID, cardType) values (149, 1);
insert into cardTypeCard (cardID, cardType) values (150, 1);
insert into cardTypeCard (cardID, cardType) values (151, 1);
insert into cardTypeCard (cardID, cardType) values (152, 1);
insert into cardTypeCard (cardID, cardType) values (153, 1);
insert into cardTypeCard (cardID, cardType) values (154, 1);
insert into cardTypeCard (cardID, cardType) values (155, 1);
insert into cardTypeCard (cardID, cardType) values (156, 1);
insert into cardTypeCard (cardID, cardType) values (157, 1);
insert into cardTypeCard (cardID, cardType) values (158, 1);
insert into cardTypeCard (cardID, cardType) values (159, 1);
insert into cardTypeCard (cardID, cardType) values (160, 1);
insert into cardTypeCard (cardID, cardType) values (161, 1);
insert into cardTypeCard (cardID, cardType) values (162, 1);
insert into cardTypeCard (cardID, cardType) values (163, 1);
insert into cardTypeCard (cardID, cardType) values (164, 1);
insert into cardTypeCard (cardID, cardType) values (165, 1);
--land
insert into cardTypeCard (cardID, cardType) values (131, 5);
insert into cardTypeCard (cardID, cardType) values (132, 5);
insert into cardTypeCard (cardID, cardType) values (133, 5);
insert into cardTypeCard (cardID, cardType) values (134, 5);
insert into cardTypeCard (cardID, cardType) values (135, 5);
insert into cardTypeCard (cardID, cardType) values (136, 5);
insert into cardTypeCard (cardID, cardType) values (137, 5);
insert into cardTypeCard (cardID, cardType) values (138, 5);
insert into cardTypeCard (cardID, cardType) values (139, 5);
insert into cardTypeCard (cardID, cardType) values (140, 5);
insert into cardTypeCard (cardID, cardType) values (141, 5);
insert into cardTypeCard (cardID, cardType) values (142, 5);
insert into cardTypeCard (cardID, cardType) values (143, 5);
insert into cardTypeCard (cardID, cardType) values (144, 5);
insert into cardTypeCard (cardID, cardType) values (145, 5);
insert into cardTypeCard (cardID, cardType) values (146, 5);
insert into cardTypeCard (cardID, cardType) values (147, 5);
insert into cardTypeCard (cardID, cardType) values (148, 5);
insert into cardTypeCard (cardID, cardType) values (149, 5);
insert into cardTypeCard (cardID, cardType) values (150, 5);
insert into cardTypeCard (cardID, cardType) values (151, 5);
insert into cardTypeCard (cardID, cardType) values (152, 5);
insert into cardTypeCard (cardID, cardType) values (153, 5);
insert into cardTypeCard (cardID, cardType) values (154, 5);
insert into cardTypeCard (cardID, cardType) values (155, 5);
insert into cardTypeCard (cardID, cardType) values (156, 5);
insert into cardTypeCard (cardID, cardType) values (157, 5);
insert into cardTypeCard (cardID, cardType) values (158, 5);
insert into cardTypeCard (cardID, cardType) values (159, 5);
insert into cardTypeCard (cardID, cardType) values (160, 5);
insert into cardTypeCard (cardID, cardType) values (161, 5);
insert into cardTypeCard (cardID, cardType) values (162, 5);
insert into cardTypeCard (cardID, cardType) values (163, 5);
insert into cardTypeCard (cardID, cardType) values (164, 5);
insert into cardTypeCard (cardID, cardType) values (165, 5);
--forest
insert into cardTypeCard (cardID, cardType) values (131, 18);
insert into cardTypeCard (cardID, cardType) values (132, 18);
insert into cardTypeCard (cardID, cardType) values (133, 18);
insert into cardTypeCard (cardID, cardType) values (134, 18);
insert into cardTypeCard (cardID, cardType) values (135, 18);
insert into cardTypeCard (cardID, cardType) values (136, 18);
insert into cardTypeCard (cardID, cardType) values (137, 18);
--island
insert into cardTypeCard (cardID, cardType) values (138, 19);
insert into cardTypeCard (cardID, cardType) values (139, 19);
insert into cardTypeCard (cardID, cardType) values (140, 19);
insert into cardTypeCard (cardID, cardType) values (141, 19);
insert into cardTypeCard (cardID, cardType) values (142, 19);
insert into cardTypeCard (cardID, cardType) values (143, 19);
insert into cardTypeCard (cardID, cardType) values (144, 19);
--mountain
insert into cardTypeCard (cardID, cardType) values (145, 21);
insert into cardTypeCard (cardID, cardType) values (146, 21);
insert into cardTypeCard (cardID, cardType) values (147, 21);
insert into cardTypeCard (cardID, cardType) values (148, 21);
insert into cardTypeCard (cardID, cardType) values (149, 21);
insert into cardTypeCard (cardID, cardType) values (150, 21);
insert into cardTypeCard (cardID, cardType) values (151, 21);
--plains
insert into cardTypeCard (cardID, cardType) values (152, 20);
insert into cardTypeCard (cardID, cardType) values (153, 20);
insert into cardTypeCard (cardID, cardType) values (154, 20);
insert into cardTypeCard (cardID, cardType) values (155, 20);
insert into cardTypeCard (cardID, cardType) values (156, 20);
insert into cardTypeCard (cardID, cardType) values (157, 20);
insert into cardTypeCard (cardID, cardType) values (158, 20);
--swamp
insert into cardTypeCard (cardID, cardType) values (159, 22);
insert into cardTypeCard (cardID, cardType) values (160, 22);
insert into cardTypeCard (cardID, cardType) values (161, 22);
insert into cardTypeCard (cardID, cardType) values (162, 22);
insert into cardTypeCard (cardID, cardType) values (163, 22);
insert into cardTypeCard (cardID, cardType) values (164, 22);
insert into cardTypeCard (cardID, cardType) values (165, 22);
