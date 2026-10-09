# dotfiles

Mein Setup für Rust-Entwicklung unter WSL/Ubuntu: **Helix** links, **Zellij** als Doppel-Fenster, rechts die Shell. Fehler erscheinen live beim Tippen (rust-analyzer), Clippy läuft beim Speichern.

## Inhalt

```
helix/config.toml          Kürzel (\r \c \b \t \f), Inline-Fehler, relative Zeilennummern, Inlay-Hints, jk
helix/languages.toml       Clippy als Check, Auto-Format für Rust
zellij/layouts/dev.kdl     Layout: links Helix, rechts Shell
bash/dev-functions.sh      Funktionen h, hw, r, cl, fm und Alias dev
```

## Voraussetzungen

- Ubuntu (WSL oder nativ)
- Rust über [rustup](https://rustup.rs), dazu `rustup component add rust-analyzer clippy rustfmt`
- Helix (`sudo snap install helix --classic`)
- Zellij (`sudo snap install zellij --classic`)

## Installation

```bash
git clone https://github.com/Lukasmau/dotfiles.git ~/dotfiles

mkdir -p ~/.config/helix ~/.config/zellij/layouts
ln -sf ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -sf ~/dotfiles/zellij/layouts/dev.kdl ~/.config/zellij/layouts/dev.kdl

echo 'source ~/dotfiles/bash/dev-functions.sh' >> ~/.bashrc
source ~/.bashrc
```

Wer schon eigene Configs hat, sichert sie vorher, denn `ln -sf` überschreibt vorhandene Dateien.

## Benutzung

```bash
cd ~/mein-rust-projekt
dev                  # startet Zellij: links Helix, rechts Shell
h src/main.rs        # öffnet die Datei links
r                    # speichern + cargo run
```

### Befehle im rechten Pane

| Befehl | Wirkung |
|--------|---------|
| `h datei.rs` | Datei links in Helix öffnen |
| `hw` | alle Dateien links speichern |
| `r` / `r -- 6` | speichern + `cargo run` (mit Argumenten) |
| `cl` | speichern + `cargo clippy` |
| `fm` | speichern + `cargo fmt` |

`h` und `hw` funktionieren nur, wenn links Helix läuft.

### Kürzel in Helix (Normal-Modus)

| Kürzel | Wirkung |
|--------|---------|
| `\r` `\c` `\b` `\t` `\f` | `cargo run` / `clippy` / `build` / `test` / `fmt` |
| `Leertaste` `d` | Liste aller Fehler |
| `Leertaste` `k` | Erklärung zur Stelle unter dem Cursor |
| `Leertaste` `a` | Code-Aktionen / Fix-Vorschläge |
| `]d` / `[d` | nächster / vorheriger Fehler |
| `gd` / `gr` | Definition / Verwendungen |
| `jk` (Insert-Modus) | zurück in den Normal-Modus |

### Zellij

| Taste | Wirkung |
|-------|---------|
| `Alt+h` / `Alt+l` | zwischen links und rechts wechseln |
| `Strg+s` | Scroll-Modus (`Esc` beendet) |
| `Strg+q` | Zellij beenden |

## Hinweise

- Neues Helix-Config-Update laden: `:config-reload`, rust-analyzer neu starten: `:lsp-restart`
- Helix im Projektordner starten, damit rust-analyzer das Cargo-Projekt findet
- Beim ersten Start in einem Projekt braucht rust-analyzer einige Sekunden zum Einlesen
- Tutorial: `hx --tutor`
