+++
title = "How it works"
description = "A day in Terrarium: what each person knows, how they decide, and how a whole world's choices resolve at once."
[extra]
eyebrow = "The simulation"
next = { title = "The world", url = "/world/" }
+++

Terrarium runs in days. On every day, every person looks at their surroundings, decides what to do, and the world applies everyone's choices together.

## A person

Each person is built in layers, from what never changes to what changes every day.

```
IDENTITY        personality (five traits), values, one life aspiration
   │
BELIEFS         where food is, who can be trusted, whose land this is
   │            (learned from experience, and possibly wrong)
   │
TODAY           what they can see, what they need, what they're about
   │
ACTION          move, gather, eat, rest, share, court, build, claim, fight…
```

**Identity** is stable: a simplified Big Five personality, a few core values and one aspiration, such as to be respected, to protect those around them, or to explore. **Beliefs** update from what happens to them and what others tell them, so they can be out of date or plain wrong. **Memory** keeps the episodes behind those beliefs: who gave them food, who attacked them, who courted them.

## A day

1. **The world turns.** Plants and wood regrow, herds breed and wander, food spoils, the season and weather change, illness spreads between neighbours.
2. **Everyone looks.** Each person sees a few cells around them, the people nearby (how hungry, hurt or well supplied they look) and what's on the land.
3. **Everyone decides.** A language model thinks the day through for them, or, without one, they act on [instinct](/instinct/).
4. **Everything resolves at once.** All choices are applied together against the same morning. Walking away doesn't dodge a blow struck the same day.
5. **Beliefs update.** People remember what they did and what was done to them, and what they saw done to others.

## The world never decides for anyone

This is the rule everything else follows. The engine applies the physics of what people do: the damage of a blow, the food taken, the shelter finished. It updates what they perceive and believe. It never chooses on anyone's behalf: no automatic defence, no allies stepping in unasked, no land that refuses a stranger. A claim to land is a belief. Whether to respect it, defend it or ignore it is up to the people involved.

## Watching

Every action becomes an event. The viewer shows the world as it unfolds; the full log, a readable chronicle and periodic snapshots are written out for analysis, so a run can be replayed and its turning points traced back to their causes.
