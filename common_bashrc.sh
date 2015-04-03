color_base=30
bgcolor_base=40

for color in BLACK RED GREEN YELLOW BLUE PURPLE CYAN GRAY; do
    eval $color=\"'\[\e[0;'${color_base}m'\]'\"
    eval B$color=\"'\[\e[1;'${color_base}m'\]'\"
    eval BG$color=\"'\[\e['${bgcolor_base}m'\]'\"
    (( color_base = $color_base + 1 ))
    (( bgcolor_base = $bgcolor_base + 1 ))
done

RESET="\[\e[0m\]"

mcd() { mkdir -p "$1"; cd "$1"; }

pd() {
    if [[ "$1" =~ ^[0-9+]$ ]]; then
        target_dir=".."
        for (( i=2; i<=$1; i++ )); do
            target_dir="${target_dir}/.."
        done;
        cd $target_dir
    fi
}
