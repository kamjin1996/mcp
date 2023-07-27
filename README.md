# Introduction
This script is a multi-file copying tool that allows you to copy files from a specified list of source files to multiple target directories. It supports using the -s/--sources parameter to specify the list of source files and the -t/--targets parameter to specify the list of target directories. Additionally, the -f/--force parameter enables force copying, which means existing files in the target directories will be overwritten. The script also provides a -h/--help parameter to display usage help information. During the copying process, the script checks the existence of files and directories, and it provides user-friendly error messages and logging output.

# Usage
<code>chmod +x 755 mcp.sh</code>
<br>then:<br>
<code>./mcp.sh -s text* -t dir1 dir2<br>
./mcp.sh -s text1 text2 ../text3 -t dir1 dir2</code>
