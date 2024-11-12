# MIT License
#
# Copyright (c) 2024 Branden Garrett and contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ======================================================================
# Set version

curent_verison="0.1.0"

# ======================================================================
# Check the shell

if [ -z "$SHELL" ]; then
  echo "Shell not found. Exiting."
  exit 1
fi

case "$SHELL" in
  */bash|*/zsh)
    echo "Shell is $SHELL. Continuing..."
    ;;
  *)
    echo "Unsupported shell: $SHELL. Exiting."
    exit 1
    ;;
esac

# ======================================================================
# Check if dotfiles are already installed

dfs_version_file="$HOME/.dfs"

if [ -f "$dfs_version_file" ]; then
  echo "Dotfiles are already installed. Version: $(cat $dfs_version_file)"
  echo "Incoming Verison is: $curent_verison"
  read -p "Do you want to reinstall the dotfiles? (y/n): " reinstall_choice
  case "$reinstall_choice" in
    y|Y )
     echo "Reinstalling the dotfiles..."
     ;;
    n|N )
      echo "Installation aborted."
      exit 0
      ;;
    * )
      echo "Invalid input. Exiting."
      exit 1
      ;;
  esac
fi

# ======================================================================
# Create .dfs file to indicate installation

echo "$curent_verison" > "$dfs_version_file"

# ======================================================================
# Let's go!
