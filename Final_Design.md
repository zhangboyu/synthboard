**Audio**

To output the specific frequencies, a table was found (http://www.math.niu.edu/~rusin/uses-math/music/frequencies). This allowed for a tuning of sorts to produce the notes associated with a typical instrument. It is possible to produce whatever frequency desired but it may not sound good to the human ear.

**1. Square wave**

The first thing we did was to generate square pulses. This is can be accomplished by using the clock and dividing the 50 Mhz clock frequency into smaller pieces and using this to create waves. This was relatively straightforward and some helpful example code was found at (http://www.johnloomis.org/digitallab/audio/audio2/audio2.qdoc.html) and also a similar project that was done by Aaron Pittenger and Rachel Grady in the fall of 2010.

The code that was downloaded had a predetermined 36 notes for the square waves. This would correspond to 3 octaves on the keyboard (7 white notes and 5 black notes per octave). We thought the bottom end was too low so we moved the lowest note up one octave. It also had 2 volume levels. This was accomplished by changing the amplitude of the peak of the square wave. If the switch was on/off it would feed it the corresponding volume amplitude.

After creating the waves, the johnloomis code was modified to be used in the audio output. John Loomis does this by using I2C to initialize the audio codec and also a DAC converter to output the sound. I didn't quite understand this part, but it works and that is all that matters.

**2. Sine wave**

We weren't satisfied with a square wave so we decided to tackle the sine wave next. In the John Loomis code it produces a sine wave with a number of discrete data points. This is the base with which you create the sounds. Essentially, all you are doing is cycling through these points. If you want to change the frequency of the sine wave you must simply cycle through these points at a faster rate. Because the DE2 board just has two clocks, one is 27MHz and another one is 50MHz. It raise up two problems.

1. It is impossible to precisely generate the frequencies we need for different notes, since it just allowed us to divide the 50MHz clock into some limited frequencies. The notes we created are actually deviate from the accurate one.

2. When we divided the frequency into some lower frequencies. We found that if we could divide it by two times or more, the sound would be better, otherwise there would be more noisy in the sound. For example, if you want to divide 1000Hz into 10Hz, it would be sounds better if you first divide it into 100Hz and then 10Hz. If you divide 1000Hz into 10Hz at once, there would be much more noisy in the sound. However, not all frequencies allowed us to divide it twice or more. For example, if you want to divide 1000Hz into 177Hz, there is noway to divide it twice or more.

Next the sine wave was broken up into the 36 different frequencies as well. This allows the user to use either a sine or square wave by flipping switch. This was a bit more challenging because it would have to be programmed manually. A similar volume function was added here for the sine function. This took more effort because the values had to be written to a table similar to the first one but was decremented by one half.

**Key board**

Since we decided to use the keyboard as our input for this project, how to let the keyboard to talk to the DE2 board is the kay problem. However, there are some sources in the johnloomis website we found are very useful(http://www.johnloomis.org/digitallab/ps2lab1/ps2lab1.html). We used his code to let the DE2 board get the input from keyboard. The works we did is to connect the keyboard input with audio module and monitor (see below). We hard coded to tell the DE2 board what the output should be when one key on the keyboard is pressed.

**VGA monitor**

The final step here is to implement the display on the monitor. On here we want it to display a piano keyboard. When the user presses a button on the computer keyboard it would show the corresponding key on the monitor. VGA Lab1 by John Loomis was a very helpful reference here for drawing rectangles (http://www.johnloomis.org/digitallab/vgalab/vgalab1/vgalab1.html).

**Conclusion**

By doing this project, we learned how to use the peripherals of the DE2 board. We also learned how to link different parts together and make them work properly. From this project, we realized that there are a lot of works behind those "simple" things. This project also made us realized that the hardware can really limit the outcomes of the whole project.

**What else we can do**

There are couple improvements we can do if we have time.

1. We can try to use external clock to generate frequencies that are closer to the accurate frequencies, so that the sounds can be more precisely.

2. We can try to build some filters inside the board to filter out the frequencies we do not want, so that the noisy can be eliminated to some extent, and will sounds cleaner.

3. We can try to make monitor part better. Make it looks like a real piano and show some animation when key is pressed.

4. We need to figure out the how johnloomis codes work. That will let us have a better understanding of the communication between different devices.

# Video Demonstration #
http://www.youtube.com/watch?v=jRVPfyQ-fj4