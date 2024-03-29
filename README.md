# 100 LITTLE GUYS README
----------------------

This repo is for a Godot 4 game dev project among friends.  This document is mainly to keep some info handy for new people jumping onto the project looking to get started.

## **BACKGROUND**

### - What's the game concept?
- Elevator pitch: "Logic game where you're given a huge number of mysterious creatures and have to experiment to deduce and catalogue what they are, in a minimalistic style."

### - What's a 'little guy'?
- Like any sort of creature you'd see in a 'mons type game.  Some are monsters, some are basically just animals, some are humanoid.  But each is meant to be its own unique entity with its own personality.

### - Okay, so how does the game work?
- The game is inspired by Pokemon Red in aesthetic, the idea being that using very simplistic graphics and hardware means that you're limited in how much personality you can give to a 'mon.  However instead of a limitation, we're using that as a core gameplay feature.  To make the game challenging from a logic standpoint, the little guys aren't immediately easy to differentiate.  They use the same sprites, walk around the world the same way, make the same sounds.  To know what they're looking for, the player will have an in-game index of every guy in the game (the "Guyde").  That will give them the hints they need to experiment.  "Alright, I know there's a guy that likes running into walls.  It might be this one, so let's drag him away from the wall and see where he goes."  Once you've discovered a guy's identity, you'll drag him from the play area into a catalogue (the "Guy Box"), where each guy has his own unique slot.  Put him in the right slot, and that's one guy checked off the list.  Just 99 to go then!  The game ends once you've stashed away all 100 of the suckers.

### - What needs to be built?
- The idea of this game is that the background functions are pretty simple, but the code for the guys is all unique.  At this point (3/29/2024), a lot of the baseline code is still in the works: spawning guys, clicking and dragging them, putting them in the catalogue, etc.  However the bulk of the work will come in coding each guy to have a unique behaviour.  There's 100 of them after all!  Any of these should be pretty easy to make their own unique script for without impacting much else in the game, so this project should be well suited for easy GitHub integration.

## **PRACTICAL INFO**

### - How do I hook up Godot 4 to GitHub?
- You'll need Godot 4 the GitHub desktop app installed.  I'll review this later to make sure it's accurate (if this note is here long after 3/29/2024, bug me about it), but I believe the way to do it will be to branch from Main on this page, open that branch in GitHub desktop, and then ideally that just opens up a Godot 4 project?  I've only gone the other direction from an existing Godot 4 project so I need to verify this.

### - How do I make a new guy?
- There are four abstract classes currently in place, as shown below:
```
                       -------------------
      ---------------> | base_pillar_guy |
      |                -------------------
 ------------           ----------------
| base_guy |  -------> | base_orb_guy |
 ------------           ----------------
      |                --------------------
      ---------------> | base_stretch_guy |
                       --------------------
```
- All basic functions will extend from base_guy.  The other three are archetypes based on a very loose categorization
  - Pillar Guy is slow, possibly immobile.
  - Orb Guy walks around at a middling pace (the default Guy).
  - Stretch Guy runs around in little bursts.
  - This is mostly for consistent flavor, don't get too caught up on picking the right one if your guy doesn't fit cleanly into a category, any will work.  
- To make a new guy, pick whichever abstract class you want to pull from.  Find that .tscn file in the resources (should be in the Base Guys folder, ex. base_pillar_guy.tscn).  Duplicate that file and double click to enter it.  This will give you a new guy with all of the standard node elements that are expected by the abstract classes.  Select the top node of the scene, which should be a Character2D node, and rename it to whatever you want your guy to be named.  Rename the scene in the same way and save it.  Then, select the Character2D node again, and hit the button with the page and red X icon to detatch the existing script.  It will then change into a script with a green check icon instead.  Hit that to generate a new unique script for this guy.  Give the script a name that matches the scene name, and enter the script.  If there is any existing code in the script, delete ALL of it EXCEPT the "extends" line at the very top.  Change it from "extends Character2D" to extending the class you copied from (either Pillar_Guy, Orb_Guy, or Stretch_Guy).  Now everything inherits from the abstract class!  You should be able to drop this guy into the scene and have it run around just like you'd expect a generic guy of that class to.

### - How to I make unique code for my guy?
- The recommended method is to do a unique function override.  Check out the structure outlined in the base_guy script: there are a number of functions that get called to provide the basic guy behaviour.  There will be predefined functionality for a variety of states: when the guy is created, when it's picked up, when it dies, etc.  The most utilized one of these will be func onPonder.  This is a simple script that has the guy do a set action after a certain amount of time, and then loop back to it later.  For the base guys, it dictates movement.
- To override a function, just use the EXACT same function name in your specific guy's code.  Now your function supercedes the original.  It will get called at the same time as usual for any other guy, but it does what you say now instead.  Keep in mind that if you want to keep some of the existing code, you'll need to restate it in your function (for example if you want to update onPonder but you still want the guy to walk normally).  Sticking to overriding functions is important, since that means your code plays nicely with whatever other behaviours other guys will have (for example, if I make a Freeze guy that delays everyone else's onPonder actions, this ensures yours will fit in as expected without any extra code needed).

### - What's a good effect for a guy to have?
- There is a link of ideas currently thought up in this GitHub.  Feel free to use one of those or add your own!  In general I'm working up a list of guydelines that I think will be effective (which admittedly not everything on the idea list conforms to yet...which is why new ideas are welcome!)
     - Effects should be subtle: since it's a deduction game, we don't want too many easy effects that are instantly recognizeable.  We'll throw in a few softballs for new players though, so some of these are fine
     - Movement effects are our bread and butter: these are easy to show visually, and neat to code.  Most guys in the idea doc currently have some sort of weird movement
     - Gimmick effects are prime real estate: we have a guy that mutes the game audio, a guy that hides in the Guyde itself, a guy that no-clips through walls.  They might be easy, but they're different and cool
     - OnDeath effects should happen sparingly: when guys die, they go back to the spawn pool.  If a guy's whole deal takes place when he dies, it'll be hard to actually single it out and store it.
     - Effects need to be differentiable: this might be tricky with so many guys, but the player has to be able to deduce who is who.  Guys with _similar_ traits are great, so long as you can tell who's who side by side

### - Can I make unique art for my guy?
- Yes!  Each guy will have a unique portrait in the Guyde (similar to a Pokemon game's Pokedex).  I've used Pixel Studio on my Android smartphone for all current art which I recommend if you want to draw on the go, otherwise any desktop app that lets you zoom to the pixel level work just as well, like Gimp.  A couple rules on art:
     - Images should be 56x56 px, and exported as .png files.
     - Sprites can only be made up of exactly black and white, plus a transparency layer
     - Please ensure that that transparency layer is used when appropriate, as opposed to a background filled in with white or black
     - Guys vaguely fit into one of three categories, and ideally their visuals at least sort of fit into those groupings:
         -Pillar Guy, sometimes immobile, taller than he is wide, vaguely [] or i shape silhouette
         -Orb Guy, vaguely mobile, vaguely O or C shape silhouette
         -Stretch Guy, speedly, sleek, vaguely A or R shape silhuoette
         -The above are loose suggestions, if you have a cool idea that doesn't quite fit, don't sweat it.  Better to have a slightly different portrait than no portrait!

### - How should I upload my contribution to the project?
- The preferred method will be through branching and merging.  Follow good GitHub practices for commiting and making pull requests, and ask if there's any confusion.  Make sure your commits are well labeled so we know who to attribute to what work.  Each guy does not need its own unique branch per se, but make sure if you're making various changes at once that it's very clear what they are for everyone else.
- Also, update the Idea List when applicable.  If you've started a branch to implement a specific guy, mark it as claimed.  If it's finished and being sent to main mark it as completed.
