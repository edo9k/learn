
# Graphviz charts

In this repo I'm using graphviz flowcharts to explore how some popular (and essential) algorithms work.
The code in python, each example has it's own accompanying flowchart.

With graphviz installed, you can generate the png graph with the following commands:

```

function dotpng() {
    for file in "$@"; do
        if [[ -f "$file" && "$file" == *.dot ]]; then
            local output="${file%.dot}.png"
            dot -Tpng "$file" -o "$output"
            echo "Generated: $output"
        else
            echo "Skipping: $file (not a .dot file)"
        fi
    done
}

```

