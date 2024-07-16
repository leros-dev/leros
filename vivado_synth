#!/bin/bash

# Default values
PART=""
TOP=""
OUTDIR="build"

# Function to display usage information
usage() {
    echo "Usage: $0 [-p|--part <part_number>] [-x|--xdc <constraint_file>] [-t|--top <top_module>] [-o|--outdir <output_directory>] <input_files>"
    echo "Options:"
    echo "  -p, --part <part_number>        Specify the part number"
    echo "  -x, --xdc <constraint_file>     Specify the constraint file"
    echo "  -t, --top <top_module>          Specify the top module"
    echo "  -o, --outdir <output_directory> Specify the output directory (default: build)"
    echo "  -h, --help                      Display this help message"
    echo "Example: $0 -p xc7a35tcpg236-1 -x constr.xdc -t my_module -o gen foo.v bar.v my_module.v"
    exit 1
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--part)
            PART="$2"
            shift 2
            ;;
        -x|--xdc)
            XDC="$2"
            shift 2
            ;;
        -t|--top)
            TOP="$2"
            shift 2
            ;;
        -o|--outdir)
            OUTDIR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            break
            ;;
    esac
done

# Check if required arguments are provided
if [[ -z $TOP  ]]; then
    echo "Error: Top module must be provided."
    usage
fi

if [[ -z $PART ]]; then
    echo "Error: Part number must be provided."
    usage
fi

if [[ -z $XDC ]]; then
    echo "Error: Constraint file must be provided."
    usage
fi

# Check if input files are provided
if [[ $# -eq 0 ]]; then
    echo "Error: No input files provided."
    usage
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTDIR"

# Print arguments
echo "Part: $PART"
echo "Top module: $TOP"
echo "Output directory: $OUTDIR"
echo "Input files: $@"

# Generate Vivado tcl script
tcl_cmds="
read_verilog [ glob $@ ];
read_xdc $XDC;
synth_design -top $TOP -part $PART;
write_checkpoint -force $OUTDIR/${TOP}_synth.dcp;

opt_design;
place_design;
route_design;
write_checkpoint -force $OUTDIR/${TOP}_routed.dcp;

report_utilization -file $OUTDIR/${TOP}_util.rpt;
report_timing_summary -file $OUTDIR/${TOP}_sta.rpt;

write_bitstream -force $OUTDIR/${TOP}.bit;
"
echo "$tcl_cmds" > $OUTDIR/${TOP}_synth.tcl

# Run Vivado in batch mode
vivado -mode batch -nojournal -nolog -notrace -source $OUTDIR/${TOP}_synth.tcl
