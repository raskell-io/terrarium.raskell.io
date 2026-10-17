# terrarium.raskell.io

Website for [Terrarium](https://github.com/raskell-io/terrarium), a world simulation of
emergent societies. The site also hosts the browser (WebAssembly) build of the viewer at
`/play/`, and runs it live on the home page.

**Live:** https://terrarium.raskell.io

## Quick start

```bash
mise install          # tools
mise run serve        # site only, http://127.0.0.1:1111
mise run preview      # site + viewer, served like Cloudflare Pages does
```

To preview with a viewer you built yourself (`web/build.sh` in the terrarium repo):

```bash
zola build --base-url http://127.0.0.1:8081
TERRARIUM_WEB_DIR=../terrarium/web scripts/fetch-viewer.sh public/play
python3 -m http.server 8081 -d public
```

## Tasks

| Task | Description |
|------|-------------|
| `mise run serve` | Dev server with live reload (no viewer) |
| `mise run build` | Build the site into `public/` |
| `mise run fetch-viewer` | Put the latest browser build of the viewer into `public/play/` |
| `mise run preview` | Build, add the viewer, run `wrangler pages dev` |

## Structure

```
terrarium.raskell.io/
├── config.toml            # Zola configuration
├── content/               # Home, how it works, the world, instinct, run it
├── sass/style.scss        # The viewer's palette: slate, moss, wheat; JetBrains Mono + Newsreader
├── scripts/
│   ├── cf-pages-build.sh  # Cloudflare Pages build command
│   └── fetch-viewer.sh    # Latest browser build of the viewer -> public/play/
├── static/                # Icons, seal, social card, _headers
└── templates/             # Zola templates
```

## Hosting

Cloudflare Pages project `terrarium-raskell-io` (raskell.io account), connected to this
repository like the other Pages sites: every push to `main` deploys, pull requests get preview
URLs. Custom domain: `terrarium.raskell.io`.

- Build command: `scripts/cf-pages-build.sh` (installs Zola, builds, adds the viewer)
- Build output: `public`

The viewer comes from the `web-latest` release of raskell-io/terrarium, which its "Web build"
workflow publishes on every push to `main`; the workflow then calls this project's deploy hook
(the `PAGES_DEPLOY_HOOK` secret in the terrarium repo) so the site rebuilds with it.
Cloudflare Pages serves at most **25 MiB per file**; `fetch-viewer.sh` fails the build if the
viewer's `.wasm` grows past that.
