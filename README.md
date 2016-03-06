This is a small project to try and replicate games like
Mafia or Trouble in Terrorist Town in a small, text-based
system. Currently the goals are to be able to have AI that
can act and respond to other AI appropriately, with future
plans to expand into player interaction, emergent storytelling,
and perhaps some kind of visuals.

You can see my outdated and long-since considered plans for this project spewed out [here](https://workflowy.com/s/a7z2Kf9OVp).

ABOUT
===
What is HereSim?
---
HereSim is a text-based AI simulation, which is modeled to simulate various acts of subterfuge and suspicion by the residents of a medieval-era village/hamlet. The easiest comparison to make is to the social game, Mafia.

How is HereSim being made?
---
HereSim is being first developed as a low-level Haxe program to be run from and interacted with through the command line. Should the project expand to a more graphical model, the snowkit libraries will be used to achieve this.

Why am I making this?
---
AI has been an all-time fascination of mine, especially in the context of video games. This project enables me to not only explore the emotional and deductional capacities of AI but also the emergent stories that arise. It's this second part that I'm especially interested in expanding beyond the scope of this project, using the models of this project to dynamically generate pseudo-detective short stories.

When will HereSim be made?
---
HereSim has been sitting on my sidelines for some time now, for no particular reason besides time (or the lack of such). I'm postponing this project in favour of my Python projection project, but this will be taking its place upon its completion. So to answer the question, it will be made in due time.

DETAILS
===
Mechanics
---
HereSim has a very particular model for its two key components: the actors, and the sets. The actors are the individual people of the village that are being modeled, and they come in three flavours: townsfolk, heretics, and inquisitors. The typical ratio of these types is 7:2:1. Each actor has two principle attributes, perception and subterfuge, which are pitted against the attributes of other actors as the main metric to determine whether an actor successfully detects suspicious activity, or if they are able to get away with performing suspicious activity. In addition, actors have a reputation among other actors, which will further influence how they respond to the actions of other actors.

Actors
---
Townsfolk are simple, and are only able of taking a single action in a day. However, they are prone to gossip, and so anything a townsfolk learns (such as if he suspects another actor) is swiftly proliferated among nearby actors. The townsfolk will typically have a job, which will occupy their primary action and dictate where in town they spend their time.

Heretics are nefarious and sneaky, able to take one or two actions in a single day -- one 'cover' action, and one optional act of subterfuge. The heretics' goal is to eliminate or corrupt all members of the village. Only problem is, thanks to the 'favour' of their dark patrons, the more they act on their behalf the more deformed and visible their secret becomes. However, these gifts may sometimes bring additional abilities to augment their efficacy sometimes in the most unexpected of fashions.

Inquisitors are the stoic and merciless dispensers of Heaven's justice. Any day, an Inquisitor may accuse an individual of heresy, and spend that day interrogating questioning the accused. If the Inquisitor's judgment was correct, the accused is executed for the town to see, so that the tainted may know fear and the faithful may know justice. If the Inquisitor is mistaken, however, the townsfolk grow distrustful of the Inquisition, and will be branded as heretics less cooperative with the Inquisitor in the future. Alternatively, instead of issuing an accusation the Inquisitor may investigate either a set or an actor, potentially gaining their knowledge and uncovering valuable clues.

Sets are where actors do their actions. A set can have various sub-sets and super-sets. For example, the village itself is a set, which may have various sub-sets such as a town hall, courtyard, houses, etc. Typically, actors can only detect things that happen in their current set, and conditionally within the super- and sub-sets of their current set.
