. $(gbl log)
REPO=$D_BL_SH_DIR
gblcmd_render(){
    log "Rendering images"
    local puml_exec="$(readlink -e "$REPO/tools/plantuml.jar")"
    for pfile in $(find -L $path -name "*.puml" -type f) ; do
        if [ "$pfile" -nt "$pfile.png" ] ;then
            java -jar "$puml_exec" "$pfile" || { echo "failed to convert PUML to PNG: '$pfile'" ; return 1 ; }
            mv "${pfile:0:(-5)}.png" "$pfile.png"
            echo "Converted puml file: $pfile.png"
        else
            echo "$pfile.png already up to date"
        fi
    done
}