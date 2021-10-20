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
- Barry can only grow when it's morning and produces a new batch when all berries are picked (meaning they are off the screen)
- Berries regrow constantly when it is morning and plant is at its last stage

- during the night or when the moon is at his highest point, Barry falls asleep
- when you click the mouse at night, the plant reverses in stage or begins to get smaller per click 
- Barry changes emotions as this happens, e.g, when he reaches the second to last stage he gets nervous and eventually becomes sad when you click to the last stage
- at night, Barry cannot grow

Stages of the Day:
- depending on where the mouse cursor is placed, the day changes between morning and night 
- while the cursor is on the right side of the screen, the sun begins to rise and the moon sets, clouds appear in the background and the sky color changes to blue
- while the cursor is on the left side of the screen, the moon rises and the sun sets, as flickering stars fill the background and the sky color changes to purple
- using lerpColor I am able to transistion between the colors depending on the mouseX position

Berry Logic:
- the objects of berries are stored in an arraylist
- each berry as an initial diameter of 0, so I created a growBerry() function that increases the diameter by 1 to a random diameter ranging from (10, 25)
- changeCol() gets a random value between 0 and 1, if the value is > 0.5, the berries grow into a blur or purple color and if the value is < 0.5 they are pink in color
- checkMouseDistance() calculates the distance of a berry with the mouse pointer usinf dist() and stores that value into a float variable called d. When d is less than 20    boolean picked becomes true
- dropBerry() drops the berries when picked is true 
- When a berry is off the screen (y value > height) an isPicked boolean returns true, and the berry is removed from the arraylist, using .remove()
- berries regrow or are added to the arraylist when the number of seconds is divisible by 5 and it is morning

Environment Logic:
- created an object Stars that are stored in an array with this size of 30, that generates stars in the sky
- has a function called generateStar() that displays the stars at a random position on the screen and fills white with a random alpha value that constantly changes the opacity (giving the star a blinking effect) 
- Clouds are also stored in an array of size 20
- the clouds form at a random x between (0, width of the screen) and y between (0, 200) and with different lengths and widths
- They move right to left at random speeds using the moveClouds() function that adds a speed value to the x value of each cloud
- cloudBoundries() checks when to move the cloud left or right, by multiplying the cloudSpeed by -1
