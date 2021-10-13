# EECS1710-Project-1-Creature

The creature I created for this project is a novel plant named Barry. 
Barry, produces berries of various sizes when he is fully grown.
These berries change color every batch that is produced. 
He sleeps at night and is happy during the day depending on the his growth stage

The plant:

- The program begins with an empty pot
- Barry can only grow when it is morning, meaning when the sun is up
- for every mouse click he grows
- there are 4 phases of growth, therfore, 4 mouse presses/clicks gets the plant to its final stage  
- once he reaches the final stage, 20 berries of various sizes grow on Barry
- after each phase, Barry becomes happier 
- when the mouse cursor gets close enough to a berry, the berry falls off the screen at a random speed
- Barry can only grow when it's morning and produces one batch of berries every growth cycle 

- during the night or when the moon is at his highest point, Barry falls asleep
- when you click the mouse at night, the plant reverses in stage or begins to get smaller per click 
- Barry changes emotions as this happens, e.g, when he reaches the second to last stage he gets nervous and eventually becomes sad when you click to the last stage
- at night, Barry cannot grow

Stages of the Day:

- depending on where the mouse cursor is placed, the day changes between morning and night
- while the cursor is on the right side of the screen, the sun begins to rise and the moon sets, clouds appear in the background and the sky color changes to blue
- while the cursor is on the left side of the screen, the moon rises and the sun sets, as flickering stars fill the background and the sky color changes to purple
- using lerpColor I am able to transistion between the colors depending on the mouseX position

Logic:
- 
