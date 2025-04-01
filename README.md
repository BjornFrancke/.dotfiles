# Dotfiles

## How to

Use the `mv` command to move the file. The syntax is:

```bash
mv /path/to/original/file /new/path/to/move/file
```

For example, to move a file named example.txt from the **Desktop** to a folder named **Documents**, you would type:

```bash
mv ~/Desktop/example.txt ~/Documents/example.txt
```

Step 3: Create a Symbolic Link

After moving the file, create a symbolic link at the original location using the **ln** command with the **-s** option. The syntax is:

```bash
ln -s /new/path/to/move/file /path/to/original/file
```

Continuing with the previous example, to create a symbolic link back to the Desktop, you would type:

```bash
ln -s ~/Documents/example.txt ~/Desktop/example.txt
```

Example Commands
Putting it all together, here’s how it looks:

```bash
mv ~/Desktop/example.txt ~/Documents/example.txt
ln -s ~/Documents/example.txt ~/Desktop/example.txt
```

## Installation

1. Yazelix
   Clone https://github.com/luccahuguet/yazelix.git into ~/.config

## Commands to remember

- Dump brewfiles to dotfiles dir

  ```bash
  brew bundle dump --file ~/dotfiles/Brewfile --force --describe
  ```

- Hide default login message

```base
touch ~/.hushlogin
```
