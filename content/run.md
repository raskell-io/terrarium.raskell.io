+++
title = "Run it"
description = "Watch Terrarium in your browser, run it in a terminal, or let Claude do the thinking for its people."
[extra]
eyebrow = "Getting started"
+++

## In your browser

[Watch a world](/play/) right now. It runs entirely on your machine; nothing is sent anywhere. Pick a world by its name in the address, or press **W** in the viewer to move to the next one:

| World | | |
|---|---|---|
| [Great Valley](/play/#great_valley) | 120 people, 80 × 50 | Valleys, uplands and ten lakes. A big enough world for generations. |
| [First Winter](/play/#first_winter) | 10 people, 10 × 10 | A small band and a hard winter. |
| [Kepler-442b](/play/#exoplanet) | 12 people | An Earth-like exoplanet colony. |
| [Antarctica](/play/#antarctica) | 6 people | A polar station through the long night. |
| [Mars Colony](/play/#mars_colony) | 8 people | Hydroponics bays and nothing outside. |
| [Orbital Station](/play/#space_station) | 6 people | A station in orbit. |

### Keys

| Key | |
|---|---|
| <kbd>Space</kbd> | Pause and resume |
| <kbd>N</kbd> | One day at a time, while paused |
| <kbd>+</kbd> <kbd>−</kbd> | Faster, slower |
| <kbd>Tab</kbd>, <kbd>1</kbd>–<kbd>9</kbd>, arrows | Follow someone else (the map follows them) |
| <kbd>E</kbd> <kbd>T</kbd> <kbd>A</kbd> <kbd>F</kbd> | Events, trades, person, full details |
| <kbd>W</kbd> <kbd>R</kbd> | Next world, start over |
| <kbd>?</kbd> | All keys |

## In a terminal

You'll need [Rust](https://rustup.rs).

```sh
git clone https://github.com/raskell-io/terrarium
cd terrarium
cargo build --release

# Watch, in the same viewer as the browser
./target/release/terrarium --scenario scenarios/great_valley.toml --tui

# Or run without a screen, then read what happened
./target/release/terrarium --scenario scenarios/first_winter.toml
less output/chronicle.md
```

A run writes its full event log (`events.jsonl`), a readable chronicle (`chronicle.md`) and snapshots of the world (`states/`) to `output/`.

## With Claude thinking for them

Set an Anthropic API key and every person deliberates their days through Claude instead of acting on instinct:

```sh
export ANTHROPIC_API_KEY=sk-ant-...
./target/release/terrarium --scenario scenarios/first_winter.toml --tui
```

Each person makes one call a day, so a ten-person world makes about a thousand calls a year. The model and its settings are in the scenario's `[llm]` section.

## Make your own world

A world is a TOML file: its size and land, its people, its seasons and weather, illness, and everything in between. Copy one from [`scenarios/`](https://github.com/raskell-io/terrarium/tree/main/scenarios); every setting is listed there with its default.
