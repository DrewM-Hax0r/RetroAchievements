// The Tairyou Jigoku
// #ID = 22634

// $1894B2F: _______________________________________________________
//           Inventory Memory Values
//           _______________________________________________________
//           This marks the start of a section of memory that defines the players current inventory.
//           Starting with the next address, the game will allocate two sequential 32-bit values to describe a particular item.
//           The first value is the ID of the item itself, and the second value describes an attribute of the item. For example, for consumables it will be how many uses the item has remaining.
//           
//           The order the items appear here matches the order they appear when viewed on the inventory screen in-game. Note that this is NOT the order the player picks up the item, and the game will constantly be reordering the items in this section of memory as the player picks them up to keep a consistent sorting. For example: weapons are listed first, then health items, then key items etc. If the player has 1 healing item in their inventory, it will take up the first slot, but if a weapon is then picked up it will be in the first slot and the healing item will be shifted over to the second slot. If the player then picked up a key item, it would be in slot 3 and none of the other items will shift. When an item is fully used up, the slot it's in will be cleared and every item listed below it will be shifted up one slot to fill in the blank.

// $1894B30: [32-bit] Inventory Item ID
//           
//           0x00 = Golden Axe (Key Item)
//           0x01 = Baseball Bat (Weapon)
//           0x02 = Stick (Weapon)
//           0x03 = Golf Club (Weapon)
//           0x04 = Pipe Wrench (Weapon)
//           0x05 = Candies (Consumable Healing)
//           0x06 = Party Popper (Weapon)
//           0x07 = Eyedrops (Weapon)
//           0x08 = Warding Talisman (Weapon)
//           0x09 = Broomstick (Weapon)
//           0x0A = Bug Spray (Weapon)
//           0x0B = Key Item (Key for Car in Town-3, Key for Final Boss)
//           0x0C = Key Item (Key for Castle Boss)
//           0x0D = Key Item (Key for Castle Tower)
//           0x0E = Key Item (Key for Forest Toolshed)
//           0x0F = Key Item (Rabbit Note)
//           0x10 = Weapon (Flashlight)
//           0x11 = Magnifying Glass (Unused, not obtainable in-game)
//           0x12 = UNUSED
//           0x13 = Note that opens the shrine in the Town
//           0x14 = Pliers (Key Item)
//           0x15 = Fear Meds (Consumable Healing)
INVENTORY_ITEM_ADDRESS = 0x1894B30
function InventoryItemId() => dword(INVENTORY_ITEM_ADDRESS)

// $1894B34: [32-Bit] Inventory Item Attributes
//           Can represent something different depending on the type of item.
//           For weapons/consumables, this is the number of uses the item has remaining.
//           For rabbit notes, this is a secondary ID defining which note it is.
INVENTORY_ATTR_ADDRESS = 0x1894B34
function InventoryItemAttributes() => dword(0x1894B34)

// $1896750: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up a stick in Sewer-1.
//           BIT1 = After picking up a golf club in Sewer-1.
function ItemCollectionFlag_Sewer1_1() => bit0(0x1896750)
function ItemCollectionFlag_Sewer1_2() => bit1(0x1896750)

// $1896754: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up a flashlight in Sewer-1.
//           BIT1 = After picking up a pipe wrench in Sewer-2.
function ItemCollectionFlag_Sewer1_3() => bit0(0x1896754)
function ItemCollectionFlag_Sewer2_1() => bit1(0x1896754)

// $1896758: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up a golf club in Sewer-1 (Duplicate from flag at 0x01896750???).
//           BIT1 = After picking up a flashlight in Sewer-2 (Duplicate from flag at 0x01896754???).
function ItemCollectionFlags_3() => byte(0x1896758)

// $189675C: [8-bit] Item Collection Flags
//           !!! There is a bug where collecting some items in the game can unset some of these flags. In particular, this makes the golf club get unset and respawn frequently. Also, it seems the flag for the golf club is also shared with the third rabbit drop.
//           
//           BIT0 = After picking up items dropped by the rabbit for the first time in Sewer-3.
//           BIT1 = After picking up the golf club in Sewer-4.
//           BIT2 = After picking up items dropped by the rabbit for the second time in Sewer-3.
function ItemCollectionFlag_Sewer4_1() => bit1(0x189675C)

// $1896764: [8-bit] Item Collection Flags
//           
//           BIT1 = After collecting some bug spray in a classroom in School-1.
//           BIT2 = After collecting a golf glub in a classroom in School-1.
function ItemCollectionFlag_School1_1() => bit1(0x1896764)
function ItemCollectionFlag_School1_2() => bit2(0x1896764)

// $1896768: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up meds in a classroom in School-2.
//           BIT1 = After picking up a party popper in a classroom in School-2 (right side).
//           BIT2 = After picking up a party popper in a classroom in School-2 (left side).
//           BIT3 = After picking up the item dropped by the rabbit in School-2.
function ItemCollectionFlag_School2_1() => bit0(0x1896768)
function ItemCollectionFlag_School2_2() => bit1(0x1896768)
function ItemCollectionFlag_School2_3() => bit2(0x1896768)

// $189676C: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the bug spray in the music room in School-3.
//           BIT1 = After picking up the broom in a classroom in School-3.
//           BIT3 = After picking up the item dropped by the rabbit in School-3.
function ItemCollectionFlag_School3_1() => bit0(0x189676C)
function ItemCollectionFlag_School3_2() => bit1(0x189676C)

// $1896778: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the stick next to the first rabbit note in Forest-1.
//           BIT1 = After picking up the bug spray behind the big tree in Forest-1.
//           BIT2 = After picking up the bug spray past the branching path in Forest-1.
function ItemCollectionFlag_Forest1_1() => bit0(0x1896778)
function ItemCollectionFlag_Forest1_2() => bit1(0x1896778)
function ItemCollectionFlag_Forest1_3() => bit2(0x1896778)

// $189677C: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the golf club in Forest-2.
//           BIT1 = After picking up the candies next to the bridge in Forest-2.
//           BIT2 = After picking up the baseball bat in Forest-2.
function ItemCollectionFlag_Forest2_1() => bit0(0x189677C)
function ItemCollectionFlag_Forest2_2() => bit1(0x189677C)
function ItemCollectionFlag_Forest2_3() => bit2(0x189677C)

// $1896780: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the bug spray in Forest-3.
function ItemCollectionFlag_Forest3_1() => bit0(0x1896780)

// $1896784: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the baseball bat in Forest-4.
//           BIT1 = After picking up the stick in Forest-4.
//           BIT2 = After picking up the golf club in Forest-4.
//           BIT3 = After picking up the meds dropped by the rabbit in Forest-4.
//           BIT4 = After picking up the candies dropped by the rabbit in Forest-4.
//           BIT5 = After picking up the toolshed key dropped by the rabbit in Forest-4.
function ItemCollectionFlag_Forest4_1() => bit0(0x1896784)
function ItemCollectionFlag_Forest4_2() => bit1(0x1896784)
function ItemCollectionFlag_Forest4_3() => bit2(0x1896784)

// $189678C: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up one of the eyedrops in Town-1.
//           BIT1 = After picking up a party popper in Town-1.
//           BIT2 = After picking up the other eyedrops in Town-1.
//           BIT3 = After picking up fear meds in Town-1.
//           BIT4 = After picking up the shrine note in Town-1.
//           BIT5 = After picking up a baseball bat in Town-1.
//           BIT6 = After picking up an item dropped by the rabbit in Town-1.
function ItemCollectionFlag_Town1_1() => bit0(0x189678C)
function ItemCollectionFlag_Town1_2() => bit1(0x189678C)
function ItemCollectionFlag_Town1_3() => bit2(0x189678C)
function ItemCollectionFlag_Town1_4() => bit3(0x189678C)
function ItemCollectionFlag_Town1_5() => bit5(0x189678C)

// $1896790: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up one of the warding talismans in Town-2.
//           BIT1 = After picking up one of the warding talismans in Town-2.
//           BIT2 = After picking up one of the warding talismans in Town-2.
function ItemCollectionFlag_Town2_1() => bit0(0x1896790)
function ItemCollectionFlag_Town2_2() => bit1(0x1896790)
function ItemCollectionFlag_Town2_3() => bit2(0x1896790)

// $1896794: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up a baseball bar in Town-3.
//           BIT1 = After picking up fear meds in Town-3.
//           BIT2 = After picking up a pipe wrench in Town-3.
//           BIT3 = After picking up the item dropped by the rabbit in Town-3.
function ItemCollectionFlag_Town3_1() => bit0(0x1896794)
function ItemCollectionFlag_Town3_2() => bit1(0x1896794)
function ItemCollectionFlag_Town3_3() => bit2(0x1896794)

// $189679C: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up the tower key in the grand hall area of Castle-1.
//           BIT1 = After picking up a golf club in the corredor area of Castle-1.
//           BIT2 = After picking up some bug spray in the corredor area of Castle-1.
//           BIT3 = After picking up a party popper in the grand hall area of Castle-1.
//           BIT4 = After picking up a broom in the grand hall area of Castle-1.
//           BIT5 = After picking up the item dropped by the rabbit in Castle-1.
function ItemCollectionFlag_Castle1_TowerKey() => bit0(0x189679C)
function ItemCollectionFlag_Castle1_1() => bit1(0x189679C)
function ItemCollectionFlag_Castle1_2() => bit2(0x189679C)
function ItemCollectionFlag_Castle1_3() => bit3(0x189679C)
function ItemCollectionFlag_Castle1_4() => bit4(0x189679C)

// $18967A0: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up some candies in Castle-2.
//           BIT1 = After picking up a broom in Castle-2.
//           BIT2 = After picking up some fear meds in Castle-2.
function ItemCollectionFlag_Castle2_1() => bit0(0x18967A0)
function ItemCollectionFlag_Castle2_2() => bit1(0x18967A0)
function ItemCollectionFlag_Castle2_3() => bit2(0x18967A0)

// $18967A4: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up a golf club in Castle-3.
//           BIT1 = After picking up some bug spray in Castle-3.
//           BIT2 = After picking up a party popper in Castle-3.
//           BIT3 = After picking up the item dropped by the rabbit in Castle-3.
function ItemCollectionFlag_Castle3_1() => bit0(0x18967A4)
function ItemCollectionFlag_Castle3_2() => bit1(0x18967A4)
function ItemCollectionFlag_Castle3_3() => bit2(0x18967A4)

// $18967AC: [8-bit] Item Collection Flags
//           
//           BIT0 = After picking up some fear meds in Castle-5.
//           BIT1 = After picking up some bug spray in Castle-5.
//           BIT2 = After picking up a baseball bat in Castle-5.
//           BIT3 = After picking up a golf club in Castle-5.
//           BIT4 = After picking up the item dropped by the rabbit in Castle-5.
function ItemCollectionFlag_Castle5_1() => bit0(0x18967AC)
function ItemCollectionFlag_Castle5_2() => bit1(0x18967AC)
function ItemCollectionFlag_Castle5_3() => bit2(0x18967AC)
function ItemCollectionFlag_Castle5_4() => bit3(0x18967AC)

// $18967C0: [8-bit] Sewer Cutscene Flags
//           
//           BIT4 = After encountering bugs for the first time in Sewer-1.
function SewerCutsceneFlags() => byte(0x18967C0)

// $18967CC: [8-bit] Sewer Cutscene Flags
//           
//           BIT0 = After turning the valve to drain the water in Sewer-4.
//           BIT5 = After unlocking the door to the boss in Sewer-4.
function CutsceneFlag_SewerDrain() => bit0(0x18967CC)

// $18967D4: [8-bit] School Cutscene Flags
//           
//           BIT1 = After trying to go into the staff restroom in School-1.
//           BIT2 = After trying to go through the emergency exit in School-1.
//           BIT5 = After running into a dead end in School-1.
//           BIT6 = After trying to go through the front doors in School-1.
function SchoolCutsceneFlags() => byte(0x18967D4)

// $18967D5: [8-bit] School Cutscene Flags
//           
//           BIT1 = After interacting with a desk in a classroom on the bottom side of School-1.
//           BIT2 = After interacting with a desk in a classroom on the right side of School-1.
//           BIT3 = After interacting with a desk in a classroom on the left side of School-1.
function SchoolCutsceneFlags_2() => byte(0x18967D5)

// $18967D8: [8-bit] School Cutscene Flags
//           
//           BIT3 = After finding senpai's seat in a classroom in School-2.
function CutsceneFlag_SenpaiSeat() => bit3(0x18967D8)

// $18967DC: [8-bit] School Cutscene Flags
//           
//           BIT0 = After viewing the in-game text directly after the opening cutscene in School-3.
//           BIT1 = After unlocking the roof to reach the final boss in School-3.
//           BIT4 = After looking at the piano in the music room in School-3.
//           BIT5 = After trying to go through the emergency exit in School-3.
function SchoolCutsceneFlags_4() => byte(0x18967DC)

// $18967DD: [8-bit] School Cutscene Flags
//           
//           BIT0 = After trying to enter the boys restroom in School-3.
//           BIT1 = After looking at a desk in a classroom in School-3.
//           BIT2 = Before entering the mirror to the Town in a classroom in School-3.
//           BIT3 = After seeing the dead end in the hallway in School-3 (right side).
//           BIT4 = After seeing the dead end in the hallway in School-3 (left side).
//           BIT5 = After seeing the rabbit in the music room in School-3.
function SchoolCutsceneFlags_5() => byte(0x18967DD)

// $18967E8: [8-bit] Forest Cutscene Flags
//           
//           BIT0 = After reaching the first crossroads in Forest-1.
//           BIT1 = After seeing bugs for the first time in Forest-1.
//           BIT2 = After seeing the rabbit run away in Forest-1.
//           BIT3 = After reaching the second crossroads in Forest-1.
function ForestCutsceneFlags() => byte(0x18967E8)

// $18967EC: [8-bit] Forest Cutscene Flags
//           
//           BIT0 = After cutting the bridge rope with the golden axe in Forest-2.
//           BIT1 = After entering Forest-2 for the first time.
function ForestCutsceneFlags_2() => byte(0x18967EC)

// $18967F0: [8-bit] Forest Cutscene Flags
//           
//           BIT0 = After obtaining the golden axe from the toolshed in Forest-3.
//           BIT1 = After entering Forest-3 for the first time.
function CutsceneFlag_GoldenAxe() => bit0(0x18967F0)

// $18967F4: [8-bit] Forest Cutscene Flags
//           
//           BIT0 = After entering Forest-4 for the first time.
function ForestCutsceneFlags_4() => byte(0x18967F4)

// $18967FC: [8-bit] Town Cutscene Flags
//           
//           BIT0 = After first seeing the shrine in Town-1.
function TownCutsceneFlags() => byte(0x18967FC)

// $1896804: [8-bit] Town Cutscene Flags
//           
//           BIT0 = After using the pliers to cut the barbed wire in Town-3.
//           BIT1 = After unlocking the abandoned car in Town-3 and finding the pliers.
//           BIT2 = After seeing the abandoned car in Town-3.
function CutsceneFlag_FoundPliers() => bit1(0x1896804)

// $189680C: [8-bit] Castle Cutscene Flags
//           
//           BIT0 = After looking at the hole in the right part of Castle-1.
//           BIT1 = After looking at some armor in the center part of Castle-1.
//           BIT2 = After looking at some armor in the top part of Castle-1.
function CastleCutsceneFlags() => byte(0x189680C)

// $1896810: [8-bit] Castle Cutscene Flags
//           
//           BIT0 = After looking at the big bridge in Castle-2.
//           BIT2 = After looking at the gate behind the starting point in Castle-2.
function CastleCutsceneFlags_2() => byte(0x1896810)

// $189681C: [8-bit] Castle Cutscene Flags
//           
//           BIT0 = After unlocking the tower door in Castle-5.
function CastleCutsceneFlags_3() => byte(0x189681C)

// $1896820: [8-bit] Castle Cutscene Flags
//           
//           BIT0 = After opening the door to the boss in Castle-6.
function CastleCutsceneFlags_4() => byte(0x1896820)

// $1896830: [8-bit] Note 5 Collection Flag
//           
//           BIT0 = Note 5 Collected
function NoteCollected5() => bit0(0x1896830)

// $1896834: [8-bit] Note 6 Collection Flag
//           
//           BIT0 = Note 6 Collected
function NoteCollected6() => bit0(0x1896834)

// $1896838: [8-bit] Note 7 Collection Flag
//           
//           BIT0 = Note 7 Collected
function NoteCollected7() => bit0(0x1896838)

// $189683C: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 8 Collected
function NoteCollected8() => bit0(0x189683C)

// $1896848: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 19 Collected
function NoteCollected19() => bit0(0x1896848)

// $189684C: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 18 Collected
function NoteCollected18() => bit0(0x189684C)

// $1896858: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 1 Collected
function NoteCollected1() => bit0(0x1896858)

// $189685C: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 2 Collected
function NoteCollected2() => bit0(0x189685C)

// $1896860: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 3 Collected
function NoteCollected3() => bit0(0x1896860)

// $1896864: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 4 Collected
function NoteCollected4() => bit0(0x1896864)

// $189686C: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 14 Collected
//           BIT1 = Note 16 Collected
function NoteCollected14() => bit0(0x189686C)
function NoteCollected16() => bit1(0x189686C)

// $1896870: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 15 Collected
function NoteCollected15() => bit0(0x1896870)

// $1896874: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 17 Collected
function NoteCollected17() => bit0(0x1896874)

// $189687C: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 10 Collected
//           BIT1 = Note 13 Collected
function NoteCollected10() => bit0(0x189687C)
function NoteCollected13() => bit1(0x189687C)

// $1896880: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 9 Collected
function NoteCollected9() => bit0(0x1896880)

// $1896884: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 11 Collected
function NoteCollected11() => bit0(0x1896884)

// $1896898: [8-bit] Note Collection Flags
//           
//           BIT0 = Note 12 Collected
function NoteCollected12() => bit0(0x1896898)

// $18968A0: [32-bit] Equiped Inventory Slot
//           An index to the inventory slot of whatever item is currently equiped.
//           
//           0xFFFFFFFF = Nothing equipped
//           0x00 = Item in the first inventory slot is equipped
//           0x02 = Item in the third inventory slot is equipped
//           etc.
function EquipedInventorySlot() => dword(0x18968A0)

// $18968A4: [8-bit] Rumble Setting
//           
//           0x00 = ON
//           0x01 = OFF
function RumbleSetting() => byte(0x18968A4)

// $18968A5: [8-bit] Difficulty Setting
//           
//           0x00 = Easy
//           0x01 = Normal
//           0x02 = Hard
function DifficultySetting() => byte(0x18968A5)

// $18968A6: [8-bit] Clothes Type
//           
//           0x00 = Default school uniform
//           0x01 = Maid (Black)
//           0x02 = Maid (Red)
//           0x03 = Maid (Pink)
//           0x04 = Bunny Girl (Black)
//           0x05 = Bunny Girl (Red)
//           0x06 = Bunny Girl (Pink)
function ClothesType() => byte(0x18968A6)

// $18968A7: [8-bit] Voice Accent Setting
//           
//           0x00 = Tokyo (Default)
//           0x01 = Returning from overseas
//           0x02 = Osaka
//           0x03 = Aomori
//           0x04 = Kyoto
//           0x05 = Okinawa
function VoiceAccentSetting() => byte(0x18968A7)

// $18968BA: [16-bit] Fear Meter
//           Erika becomes more afraid as the valuie increasaes. It's game over when the value reaches it's max.
//           
//           0x0000 = No fear (default state)
//           0x4100 = Jumps right to this value from 0x0000 as soon as some amount of fear starts accumulating
//           0x43D2 = Leave near fainting status (if already in that state)
//           0x43F0 = Enter near fainting status (red text)
//           0x4416 = Faints (game over)
function FearMeter() => word(0x18968BA)

// $18968C0: [32-bit] Play Time (Total)
//           The number of seconds of total play time the current save file has been played for.
//           Includes time across multiple playthroughs (NG+)
function PlayTimeTotal() => dword(0x18968C0)

// $18968C4: [32-bit] Play Time (Playthrough)
//           The number of seconds of play time the current playthrough of the current save file has been played for.
//           Resets to 0 when starting a NG+.
//           One of the criteria for the Good End is beating the game in under 3 hours.
function PlayTimePlaythroughSeconds() => dword(0x18968C4)

// $18968C8: [8-bit] Enemies Thrown
//           Number of enemies picked up and thrown in the current playthrough.
//           One of the criteria for the Good End is throwing 50+ enemies.
function EnemiesThrown() => byte(0x18968C8)

// $18968D0: [8-bit] Progression Flags
//           
//           BIT0 = After turning the valve to drain the water in Sewer-4.
//           BIT1 = After cutting the bridge rope with the golden axe in Forest-2.
//           BIT2 = After defeating the boss in Sewer-5.
//           BIT3 = After defeating the boss in Forest-5.
//           BIT4 = After defeating the boss in Castle-9.
//           BIT5 = After defeating the boss in Town-4.
//           BIT6 = After defeating the final boss in School-4.
function DefeatedSewerBossFlag() => bit2(0x18968D0)
function DefeatedForestBossFlag() => bit3(0x18968D0)
function DefeatedCastleBossFlag() => bit4(0x18968D0)
function DefeatedTownBossFlag() => bit5(0x18968D0)
function DefeatedFinalBossFlag() => bit6(0x18968D0)

// $18968D1: [8-bit] Progression Flags
//           ???
//           
//           BIT2 = Entered the Forest for the first time.
//           BIT3 = Returned from the Forest for the first time.
//           BIT5 = Entered the Forest for the first time.
//           BIT6 = Returned from the Forest for the first time.
//           BIT7 = Entered the Sewer for the first time.
function ProgressionFlags_2() => byte(0x18968D1)

// $18968D2: [8-bit] Progression Flags
//           
//           BIT0 = Returned from the Sewer for the first time.
//           BIT1 = Entered the Castle for the first time.
//           BIT2 = Returned from the Castle for the first time.
//           BIT3 = Entered the Town for the first time.
//           BIT4 = Returned from the Town for the first time.
function ProgressionFlags_3() => byte(0x18968D2)

// $18DA0F0: [8-bit] Game State Flag
//           
//           0x00 = Main Menu
//           0x01 - 0x03 = Loading from Main Menu
//           0x04 = Pause Screen
//           0x05 = In-Game
//           0x06 = Return to Main Menu after quitting
//           0x09 = Black Fade Out Transition before loading, or Quick Menu open
//           0x0A = Loading between game areas
//           0x0B = GAME OVER
function GameStateFlag() => byte(0x18DA0F0)

// $18DACE0: [8-bit] Game Freeze Flag
//           This flag stops time in-game when set. It is used mainly for when menus are open to prevent the game from continuing in the background.
//
//           0x00 = Game Running
//           0x01 = Game Frozen
function GameFreezeFlag() => byte(0x18DACE0)

// $18DACFC: [32-bit] Map Identifier
//           
//           -1 (0xFFFFFFFF) = After loading a clear save file for BAD END
//           -2 (0xFFFFFFFE) = After loading a clear save file for NORMAL END
//           -3 (0xFFFFFFFD) = After loading a clear save file for GOOD END
//           
//           0x00 = Sewer-1
//           0x01 = Sewer-2
//           0x02 = Sewer-3
//           0x03 = Sewer-4
//           0x04 = Sewer-5
//           
//           0x05 = School-1
//           0x06 = School-2
//           0x07 = School-3
//           0x08 = School-4
//           
//           0x09 = DUMMY (Intro Cutscene?)
//           
//           0x0A = Forest-1
//           0x0B = Forest-2
//           0x0C = Forest-3
//           0x0D = Forest-4
//           0x0E = Forest-5
//           
//           0x0F = Town-1
//           0x10 = Town-2
//           0x11 = Town-3
//           0x12 = Town-4
//           
//           0x13 = Castle-1
//           0x14 = Castle-2
//           0x15 = Castle-3
//           0x16 = Castle-4
//           0x17 = Castle-5
//           0x18 = Castle-6
//           0x19 = Castle-7
//           0x1A = Castle-8
//           0x1B = Castle-9
function MapIdentifier() => dword(0x18DACFC)

// $18F76DC: _______________________________________________________
//           Start of dynamic memory
//           _______________________________________________________

// $18F7B10: [32-bit] Pointer to Primary Game Object
//           The value at this address is the address where the primary game engine object resides in memory.
//           _______________________________________________________
//           VALUE + 0x04 = [8-bit] Loading Target Flags
//           When the game is transitioning between normal gameplay and something else like a cutscene or menu, this value will determine what the game loads up next.
//
//           0x00 = Go to the title screen on next loading transition
//           0x01 = Go to the ending cutscenes on next loading transition (the value at 0x018F7B3C determines which ending plays)
//           0x02 = Go to the main menu on next loading transition
//           0x05 = Go in-game next loading transition (only used for new games to start in the school)
//           0x06 = Go in-game next loading transition (like when loading a save file)
//           0x09 = Go to the debug menu on next loading transition
//           0x0A = Go to the end game results screen on next loading transition
//           0x0B = Go to credits on next loading transition
//           0x0C = Go to the post-ending save game screen on next loading transition
//           0x0D = Go to the main menu on next loading transition (save game screen after beating game)
//           0x0E = Go to the opening cutscene on next loading transition
//
//           _______________________________________________________
//           VALUE + 0x0C = [8-bit] Ending Flag
//           When the Loading Target Flags value is set to 0x0A (the next screen is the end results screen), this value can be used to determine which ending the player got.
//
//           In that case, the ending flag values are as follows:
//           0x00 = BAD END
//           0x01 = NORMAL END
//           0x02 = GOOD END
function LoadingTargetFlag() => byte(dword(0x18F7B10) + 0x04)
function EndingFlag() => byte(dword(0x18F7B10) + 0x0C)


// ---------------------
// ----- Constants -----
// ---------------------

DIFFICULTY_EASY = 0x00
DIFFICULTY_NORMAL = 0x01
DIFFICULTY_HARD = 0x02

LOADING_TARGET_FLAG_TITLE = 0x00
LOADING_TARGET_FLAG_PRE_ENDING = 0x01
LOADING_TARGET_FLAG_MAIN_MENU = 0x02
LOADING_TARGET_FLAG_LOADED_GAME = 0x06
LOADING_TARGET_FLAG_ENDING = 0x0A
LOADING_TARGET_FLAG_CREDITS = 0x0B
LOADING_TARGET_FLAG_POST_ENDING = 0x0C
LOADING_TARGET_FLAG_FINAL_SAVE = 0x0D
LOADING_TARGET_FLAG_NGPLUS = 0x0E

ENDING_FLAG_BAD = 0x00
ENDING_FLAG_NORMAL = 0x01
ENDING_FLAG_GOOD = 0x02

GAME_STATE_MAIN_MENU = 0x00
GAME_STATE_MAIN_MENU_RETURN = 0x06
GAME_STATE_MAIN_IN_GAME = 0x05
GAME_STATE_PAUSE_MENU = 0x04
GAME_STATE_QUICK_MENU = 0x09
GAME_STATE_GAME_OVER = 0x0B

MAP_INTRO_CUTSCENE = 0x09

MAP_ID_SCHOOL_1 = 0x05
MAP_ID_SCHOOL_2 = 0x06
MAP_ID_SCHOOL_3 = 0x07
MAP_ID_SCHOOL_4 = 0x08

MAP_ID_FOREST_1 = 0x0A
MAP_ID_FOREST_2 = 0x0B
MAP_ID_FOREST_3 = 0x0C
MAP_ID_FOREST_4 = 0x0D
MAP_ID_FOREST_5 = 0x0E

MAP_ID_SEWER_1 = 0x00
MAP_ID_SEWER_2 = 0x01
MAP_ID_SEWER_3 = 0x02
MAP_ID_SEWER_4 = 0x03
MAP_ID_SEWER_5 = 0x04

MAP_ID_CASTLE_1 = 0x13
MAP_ID_CASTLE_2 = 0x14
MAP_ID_CASTLE_3 = 0x15
MAP_ID_CASTLE_4 = 0x16
MAP_ID_CASTLE_5 = 0x17
MAP_ID_CASTLE_6 = 0x18
MAP_ID_CASTLE_7 = 0x19
MAP_ID_CASTLE_8 = 0x1A
MAP_ID_CASTLE_9 = 0x1B

MAP_ID_TOWN_1 = 0x0F
MAP_ID_TOWN_2 = 0x10
MAP_ID_TOWN_3 = 0x11
MAP_ID_TOWN_4 = 0x12

ITEM_UNEQ = 0xFFFFFFFF
ITEM_BAT = 0x01
ITEM_STICK = 0x02
ITEM_GOLF_CLUB = 0x03
ITEM_PIPE_WRENCH = 0x04
ITEM_CANDIES = 0x05
ITEM_PARTY_POPPER = 0x06
ITEM_EYEDROPS = 0x07
ITEM_TALISMAN = 0x08
ITEM_BROOMSTICK = 0x09
ITEM_BUG_SPRAY = 0x0A
ITEM_FLASHLIGHT = 0x10
ITEM_STRESS_MEDS = 0x15


// ---------------------------
// ----- Logic Functions -----
// ---------------------------

function AtMainMenus() => GameStateFlag() == GAME_STATE_MAIN_MENU || GameStateFlag() == GAME_STATE_MAIN_MENU_RETURN || LoadingTargetFlag() == LOADING_TARGET_FLAG_TITLE || LoadingTargetFlag() == LOADING_TARGET_FLAG_MAIN_MENU
    || LoadingTargetFlag() == LOADING_TARGET_FLAG_LOADED_GAME || LoadingTargetFlag() == LOADING_TARGET_FLAG_FINAL_SAVE || LoadingTargetFlag() == LOADING_TARGET_FLAG_NGPLUS

function InGame() => GameStateFlag() == GAME_STATE_MAIN_IN_GAME && LoadingTargetFlag() != LOADING_TARGET_FLAG_TITLE && LoadingTargetFlag() != LOADING_TARGET_FLAG_MAIN_MENU && LoadingTargetFlag() != LOADING_TARGET_FLAG_LOADED_GAME

function RetryAfterGameOver() => prev(GameStateFlag()) == GAME_STATE_GAME_OVER && GameStateFlag() == GAME_STATE_MAIN_IN_GAME

function GetEnding(endingFlag) => InGame() && prev(LoadingTargetFlag()) == LOADING_TARGET_FLAG_PRE_ENDING && LoadingTargetFlag() == LOADING_TARGET_FLAG_ENDING && EndingFlag() == endingFlag

function InSchool() => MapIdentifier() == MAP_ID_SCHOOL_1 || MapIdentifier() == MAP_ID_SCHOOL_2 || MapIdentifier() == MAP_ID_SCHOOL_3
    || MapIdentifier() == MAP_ID_SCHOOL_4

function InForest() => MapIdentifier() == MAP_ID_FOREST_1 || MapIdentifier() == MAP_ID_FOREST_2 || MapIdentifier() == MAP_ID_FOREST_3
    || MapIdentifier() == MAP_ID_FOREST_4 || MapIdentifier() == MAP_ID_FOREST_5
    
function InSewer() => MapIdentifier() == MAP_ID_SEWER_1 || MapIdentifier() == MAP_ID_SEWER_2 || MapIdentifier() == MAP_ID_SEWER_3
    || MapIdentifier() == MAP_ID_SEWER_4 || MapIdentifier() == MAP_ID_SEWER_5
    
function InCastle() => MapIdentifier() == MAP_ID_CASTLE_1 || MapIdentifier() == MAP_ID_CASTLE_2 || MapIdentifier() == MAP_ID_CASTLE_3
    || MapIdentifier() == MAP_ID_CASTLE_4 || MapIdentifier() == MAP_ID_CASTLE_5 || MapIdentifier() == MAP_ID_CASTLE_6
    || MapIdentifier() == MAP_ID_CASTLE_7 || MapIdentifier() == MAP_ID_CASTLE_8 || MapIdentifier() == MAP_ID_CASTLE_9
    
function InTown() => MapIdentifier() == MAP_ID_TOWN_1 || MapIdentifier() == MAP_ID_TOWN_2 || MapIdentifier() == MAP_ID_TOWN_3
    || MapIdentifier() == MAP_ID_TOWN_4

function RabbitNotesCollected() => NoteCollected1() + NoteCollected2() + NoteCollected3() + NoteCollected4() + NoteCollected5()
    + NoteCollected6() + NoteCollected7() + NoteCollected8() + NoteCollected9() + NoteCollected10()
    + NoteCollected11() + NoteCollected12() + NoteCollected13() + NoteCollected14() + NoteCollected15()
    + NoteCollected16() + NoteCollected17() + NoteCollected18() + NoteCollected19()

function SchoolItemsCollected() => ItemCollectionFlag_School1_1() + ItemCollectionFlag_School1_2() + ItemCollectionFlag_School2_1()
    + ItemCollectionFlag_School2_2() + ItemCollectionFlag_School2_3() + ItemCollectionFlag_School3_1() + ItemCollectionFlag_School3_2()
    
function ForestItemsCollected() => ItemCollectionFlag_Forest1_1() + ItemCollectionFlag_Forest1_2() + ItemCollectionFlag_Forest1_3()
    + ItemCollectionFlag_Forest2_1() + ItemCollectionFlag_Forest2_2() + ItemCollectionFlag_Forest2_3() + ItemCollectionFlag_Forest3_1()
    + ItemCollectionFlag_Forest4_1() + ItemCollectionFlag_Forest4_2() + ItemCollectionFlag_Forest4_3()
    
function SewerItemsCollected() => ItemCollectionFlag_Sewer1_1() + ItemCollectionFlag_Sewer1_2() + ItemCollectionFlag_Sewer1_3()
    + ItemCollectionFlag_Sewer2_1() + ItemCollectionFlag_Sewer4_1()
    
function CastleItemsCollected() => ItemCollectionFlag_Castle1_1() + ItemCollectionFlag_Castle1_2() + ItemCollectionFlag_Castle1_3()
    + ItemCollectionFlag_Castle1_4() + ItemCollectionFlag_Castle2_1() + ItemCollectionFlag_Castle2_2() + ItemCollectionFlag_Castle2_3()
    + ItemCollectionFlag_Castle3_1() + ItemCollectionFlag_Castle3_2() + ItemCollectionFlag_Castle3_3() + ItemCollectionFlag_Castle5_1()
    + ItemCollectionFlag_Castle5_2() + ItemCollectionFlag_Castle5_3() + ItemCollectionFlag_Castle5_4()
    
function TownItemsCollected() => ItemCollectionFlag_Town1_1() + ItemCollectionFlag_Town1_2() + ItemCollectionFlag_Town1_3()
    + ItemCollectionFlag_Town1_4() + ItemCollectionFlag_Town1_5() + ItemCollectionFlag_Town2_1() + ItemCollectionFlag_Town2_2()
    + ItemCollectionFlag_Town2_3() + ItemCollectionFlag_Town3_1() + ItemCollectionFlag_Town3_2() + ItemCollectionFlag_Town3_3()

function InventoryItemIdAddress(slot) => INVENTORY_ITEM_ADDRESS + (slot * 8)
function InventoryItemAttrAddress(slot) => INVENTORY_ATTR_ADDRESS + (slot * 8)

function AllInventoryIdAddresses() {
    addresses = []
    for slot in range(0, 899) {
        array_push(addresses, InventoryItemIdAddress(slot))
    }
    return addresses
}

function UsedUpInventoryItemOnThisFrame(idAddress) {
    return prev(dword(idAddress)) != ITEM_UNEQ && dword(idAddress) == ITEM_UNEQ
}

function UsedUpWeaponOnThisFrame() => GameStateFlag() != GAME_STATE_PAUSE_MENU && GameStateFlag() != GAME_STATE_QUICK_MENU && prev(EquipedInventorySlot()) != ITEM_UNEQ && EquipedInventorySlot() == ITEM_UNEQ

function EquippedItemDecreaseUsesOnThisFrame() => EquipedInventorySlot() != ITEM_UNEQ && prev(dword(InventoryItemAttrAddress(EquipedInventorySlot()))) > dword(InventoryItemAttrAddress(EquipedInventorySlot()))

function CollectedTotalOfRabbitNotesOnThisFrame(noteCount, measure) {
    result = prev(RabbitNotesCollected()) == (noteCount - 1)
    goalReached = RabbitNotesCollected() == noteCount
    if (measure) {
        result = result && measured(goalReached, when=InGame(), format="raw")
    } else {
        result = InGame() && result && goalReached
    }
    return result
}


// ------------------------
// ----- Achievements -----
// ------------------------

achievement(
    id = 592608, badge = "671647",
    title = "It's Not For Chopping Wood", points = 3,
    description = "Find an axe made of gold",
    trigger = InGame() && MapIdentifier() == MAP_ID_FOREST_3 && prev(CutsceneFlag_GoldenAxe()) == 0 && CutsceneFlag_GoldenAxe() == 1,
    type = "progression"
)

achievement(
    id = 592609, badge = "671646",
    title = "Mothra In The Moonlight", points = 10,
    description = "Defeat the boss in the forest",
    trigger = InGame() && MapIdentifier() == MAP_ID_FOREST_5 && prev(DefeatedForestBossFlag()) == 0 && DefeatedForestBossFlag() == 1,
    type = "progression"
)

achievement(
    title = "Mothra Annihilation", points = 25,
    description = "Defeat the boss in the forest on hard mode without using any weapons or healing items",
    trigger = InGame() && DifficultySetting() == DIFFICULTY_HARD && never(MapIdentifier() != MAP_ID_FOREST_5)
              && never(UsedUpWeaponOnThisFrame()) && never(EquippedItemDecreaseUsesOnThisFrame())
              && (once(prev(MapIdentifier()) == MAP_ID_FOREST_4 && MapIdentifier() != MAP_ID_FOREST_5) || once(RetryAfterGameOver()))
              && trigger_when(prev(DefeatedForestBossFlag()) == 0 && DefeatedForestBossFlag() == 1),
    type = "missable"
)

achievement(
    id = 593190, badge = "672459",
    title = "Spin to Win", points = 3,
    description = "Lower the water level in the sewer",
    trigger = InGame() && MapIdentifier() == MAP_ID_SEWER_4 && prev(CutsceneFlag_SewerDrain()) == 0 && CutsceneFlag_SewerDrain() == 1,
    type = "progression"
)

achievement(
    id = 593191, badge = "672470",
    title = "Lurking In The Darkness", points = 10,
    description = "Defeat the boss in the sewer",
    trigger = InGame() && MapIdentifier() == MAP_ID_SEWER_5 && prev(DefeatedSewerBossFlag()) == 0 && DefeatedSewerBossFlag() == 1,
    type = "progression"
)

achievement(
    id = 593363, badge = "672714",
    title = "Castle Quest", points = 3,
    description = "Find the key to the castle tower",
    trigger = InGame() && MapIdentifier() == MAP_ID_CASTLE_1 && prev(ItemCollectionFlag_Castle1_TowerKey()) == 0 && ItemCollectionFlag_Castle1_TowerKey() == 1,
    type = "progression"
)

achievement(
    id = 593361, badge = "672689",
    title = "Lord of the Flies", points = 10,
    description = "Defeat the boss in the castle",
    trigger = InGame() && MapIdentifier() == MAP_ID_CASTLE_9 && prev(DefeatedCastleBossFlag()) == 0 && DefeatedCastleBossFlag() == 1,
    type = "progression"
)

achievement(
    id = 593806, badge = "673192",
    title = "Tairyou Theft Auto", points = 3,
    description = "Find some rusty pliers in the town",
    trigger = InGame() && MapIdentifier() == MAP_ID_TOWN_3 && prev(CutsceneFlag_FoundPliers()) == 0 && CutsceneFlag_FoundPliers() == 1,
    type = "progression"
)

achievement(
    id = 593801, badge = "673187",
    title = "Lifting the Curse", points = 10,
    description = "Defeat the boss in the town",
    trigger = InGame() && MapIdentifier() == MAP_ID_TOWN_4 && prev(DefeatedTownBossFlag()) == 0 && DefeatedTownBossFlag() == 1,
    type = "progression"
)

achievement(
    id = 596416, badge = "681561",
    title = "The Overwhelming Hell", points = 10,
    description = "Complete the game with the BAD ending on any difficulty",
    trigger = GetEnding(ENDING_FLAG_BAD),
    type = "win_condition"
)

achievement(
    id = 596417, badge = "681562",
    title = "The Mediocre Hell", points = 10,
    description = "Complete the game with the NORMAL ending on any difficulty",
    trigger = GetEnding(ENDING_FLAG_NORMAL),
    type = "win_condition"
)

achievement(
    id = 596420, badge = "681563",
    title = "The Underwhelming Hell", points = 10,
    description = "Complete the game with the GOOD ending on any difficulty",
    trigger = GetEnding(ENDING_FLAG_GOOD),
    type = "win_condition"
)

achievement(
    id = 600926, badge = "681556",
    title = "Lost Letters", points = 2,
    description = "Collect 6 notes dropped by the rabbit",
    trigger = CollectedTotalOfRabbitNotesOnThisFrame(6, false)
)

achievement(
    id = 600927, badge = "681557",
    title = "Nutty Notes", points = 5,
    description = "Collect 12 notes dropped by the rabbit",
    trigger = CollectedTotalOfRabbitNotesOnThisFrame(12, false)
)

achievement(
    id = 600928, badge = "681558",
    title = "Memo Madness", points = 10,
    description = "Collect all 19 notes dropped by the rabbit",
    trigger = CollectedTotalOfRabbitNotesOnThisFrame(19, true)
)

achievement(
    id = 593803, badge = "673189",
    title = "School Explorer", points = 5,
    description = "Collect all items hidden in the school",
    trigger = InGame() && prev(SchoolItemsCollected()) == 6 && measured(SchoolItemsCollected() == 7, when=InSchool(), format="raw")
)

achievement(
    id = 592610, badge = "671648",
    title = "Forest Explorer", points = 5,
    description = "Collect all items hidden in the forest",
    trigger = InGame() && prev(ForestItemsCollected()) == 9 && measured(ForestItemsCollected() == 10, when=InForest(), format="raw")
)

achievement(
    id = 593193, badge = "672472",
    title = "Sewer Explorer", points = 5,
    description = "Collect all items hidden in the sewer",
    trigger = InGame() && prev(SewerItemsCollected()) == 4 && measured(SewerItemsCollected() == 5, when=InSewer(), format="raw")
)

achievement(
    id = 593362, badge = "672713",
    title = "Castle Explorer", points = 5,
    description = "Collect all items hidden in the castle",
    trigger = InGame() && prev(CastleItemsCollected()) == 13 && measured(CastleItemsCollected() == 14, when=InCastle(), format="raw")
)

achievement(
    id = 593805, badge = "673191",
    title = "Town Explorer", points = 5,
    description = "Collect all items hidden in the town",
    trigger = InGame() && prev(TownItemsCollected()) == 10 && measured(TownItemsCollected() == 11, when=InTown(), format="raw")
)

achievement(
    id = 593364, badge = "672715",
    title = "Notice Me Senpai", points = 1,
    description = "Find senpai's classroom seat in the school",
    trigger = InGame() && MapIdentifier() == MAP_ID_SCHOOL_2 && prev(CutsceneFlag_SenpaiSeat()) == 0 && CutsceneFlag_SenpaiSeat() == 1
)


// -------------------------
// ----- Rich Presence -----
// -------------------------

MapLookup = {
    MAP_ID_SCHOOL_1: "School-1",
    MAP_ID_SCHOOL_2: "School-2",
    MAP_ID_SCHOOL_3: "School-3",
    MAP_ID_SCHOOL_4: "School-4",
    MAP_ID_FOREST_1: "Forest-1",
    MAP_ID_FOREST_2: "Forest-2",
    MAP_ID_FOREST_3: "Forest-3",
    MAP_ID_FOREST_4: "Forest-4",
    MAP_ID_FOREST_5: "Forest-5",
    MAP_ID_SEWER_1: "Sewer-1",
    MAP_ID_SEWER_2: "Sewer-2",
    MAP_ID_SEWER_3: "Sewer-3",
    MAP_ID_SEWER_4: "Sewer-4",
    MAP_ID_SEWER_5: "Sewer-5",
    MAP_ID_CASTLE_1: "Castle-1",
    MAP_ID_CASTLE_2: "Castle-2",
    MAP_ID_CASTLE_3: "Castle-3",
    MAP_ID_CASTLE_4: "Castle-4",
    MAP_ID_CASTLE_5: "Castle-5",
    MAP_ID_CASTLE_6: "Castle-6",
    MAP_ID_CASTLE_7: "Castle-7",
    MAP_ID_CASTLE_8: "Castle-8",
    MAP_ID_CASTLE_9: "Castle-9",
    MAP_ID_TOWN_1: "Town-1",
    MAP_ID_TOWN_2: "Town-2",
    MAP_ID_TOWN_3: "Town-3",
    MAP_ID_TOWN_4: "Town-4"
}

EndingLookup = {
    ENDING_FLAG_BAD: "BAD END",
    ENDING_FLAG_NORMAL: "NORMAL END",
    ENDING_FLAG_GOOD: "GOOD END"
}

function PlaytimeHours() => PlayTimePlaythroughSeconds() / 3600

rich_presence_conditional_display(AtMainMenus(), "At the main menu")
rich_presence_conditional_display(MapIdentifier() == MAP_INTRO_CUTSCENE, "Starting a new game")
rich_presence_conditional_display(MapIdentifier() == MAP_ID_FOREST_5 && DefeatedForestBossFlag() == 0, "Forest Boss Fight • Playtime: {0} • Notes: {1}/19 • Thrown Enemies: {2}",
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_conditional_display(MapIdentifier() == MAP_ID_SEWER_5 && DefeatedSewerBossFlag() == 0, "Sewer Boss Fight • Playtime: {0} • Notes: {1}/19 • Thrown Enemies: {2}",
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_conditional_display(MapIdentifier() == MAP_ID_CASTLE_9 && DefeatedCastleBossFlag() == 0, "Castle Boss Fight • Playtime: {0} • Notes: {1}/19 • Thrown Enemies: {2}",
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_conditional_display(MapIdentifier() == MAP_ID_TOWN_4 && DefeatedTownBossFlag() == 0, "Town Boss Fight • Playtime: {0} • Notes: {1}/19 • Thrown Enemies: {2}",
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_conditional_display(MapIdentifier() == MAP_ID_SCHOOL_4 && DefeatedFinalBossFlag() == 0, "Final Boss Fight • Playtime: {0} • Notes: {1}/19 • Thrown Enemies: {2}",
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_conditional_display(DefeatedFinalBossFlag() == 1 && (LoadingTargetFlag() == LOADING_TARGET_FLAG_ENDING || LoadingTargetFlag() == LOADING_TARGET_FLAG_CREDITS || LoadingTargetFlag() == LOADING_TARGET_FLAG_POST_ENDING), "{0} • Playtime: {1} • Notes: {2}/19 • Thrown Enemies: {3}",
    rich_presence_lookup("Ending", EndingFlag(), EndingLookup, fallback="???"),
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")    
)
rich_presence_display("{0} • Playtime: {1} • Notes: {2}/19 • Thrown Enemies: {3}",
    rich_presence_lookup("Map", MapIdentifier(), MapLookup, fallback="Lost in a Nightmare"),
    rich_presence_value("PlaytimeMinutesSeconds", PlayTimePlaythroughSeconds(), "SECS"),
    rich_presence_value("Notes", RabbitNotesCollected(), "VALUE"),
    rich_presence_value("Enemy Throws", EnemiesThrown(), "VALUE")
)