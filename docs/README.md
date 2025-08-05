# Website
[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/SchweGELBin/website/total)](https://github.com/SchweGELBin/website/releases)
[![GitHub License](https://img.shields.io/github/license/SchweGELBin/website)](../LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/SchweGELBin/website)](https://github.com/SchweGELBin/website/releases/latest)

- My Website
- Deployed on [gh-pages](https://schwegelbin.github.io/) and my [server](https://michi.my/)
- Available in my [nur expressions](https://github.com/SchweGELBin/nur-expressions) repo

## Build

### General
```bash
git clone https://github.com/SchweGELBin/website.git
cd website
pnpm build
```
Website files will be at ./dist/

### Nix
```bash
nix build github:SchweGELBin/website
```
Website files will be at ./result/
