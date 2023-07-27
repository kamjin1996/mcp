# mcp.sh - Multi-File Copying Tool
**`mcp.sh`** is a command-line shell script designed to simplify the process of copying multiple files to multiple target directories. It provides an easy-to-use interface for copying files in bulk, allowing users to specify source files and target directories as arguments.

# Usage
`./mcp.sh -s file1 file2 file3 -t dir1 dir2 [-f/--force] [-h/--help]`
# Options
- -s, --sources: Specify the source files to be copied.
- -t, --targets: Specify the target directories to copy files into.
- -f, --force: Force copy mode, overwrite destination files if they exist.
- -h, --help: Display help information about using the script.

**`mcp.sh`** performs checks for file existence and target directory validity to ensure a smooth copying process. It provides informative error messages and logs any issues encountered during the copy operation. The script aims to be versatile, user-friendly, and efficient for handling file copying tasks involving multiple sources and targets.
