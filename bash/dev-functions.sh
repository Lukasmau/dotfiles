h() {
    zellij action move-focus left
    zellij action write 27
    zellij action write-chars ":open $(realpath "$1")"
    zellij action write 13
    zellij action move-focus right
}
hw() {
    zellij action move-focus left
    zellij action write 27
    zellij action write-chars ":write-all"
    zellij action write 13
    zellij action move-focus right
}
r()  { hw && cargo run "$@"; }
cl() { hw && cargo clippy "$@"; }
fm() { hw && cargo fmt; }
alias dev='zellij --layout dev'
