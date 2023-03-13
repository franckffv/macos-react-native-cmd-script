# macos-react-native-cmd-script
This script is a time-saver for React Native developers who want to avoid typing out long commands and navigating between Terminal windows

Using this script will help you avoid this error on macos Ventura `“launchPackager.command” can’t be opened because (null) is not allowed to open documents in Terminal.`

# React Native Command Script

This is a Bash script that automates running React Native commands on macOS. It checks if the current directory is a React Native project and opens two tabs in the Terminal application. In the first tab, it starts the React Native Metro server using `npx react-native start`, and in the second tab, it runs the app on either the iOS or Android platform using `npx react-native run-ios` or `npx react-native run-android`.

## Installation

1. Clone this repository.
```bash
  git clone https://github.com/franckffv/macos-react-native-cmd-script 
```
2. Change your working directory to the cloned repository.
```bash
  cd macos-react-native-cmd-script
```

3. Make the script executable by running
```bash
  chmod +x rn.sh
```

4. Move the script to your home directory by running :
```bash
  mv rn.sh ~/
```

5. Open your `.bash_profile` or `.zshrc` file and add the following line: `alias runrn="~/rn.sh"`.
For zsh : 
```bash
  echo "alias runrn=\"~/rn.sh\"" >> ~/.zshrc
```

For bash : 
```bash
  echo "alias runrn=\"~/rn.sh\"" >> ~/.bash_profile
```

6. Reload the shell by running:
zsh user: 
```bash
  source ~/.zshrc
```
or bash user:
```bash
  source ~/.bash_profile
```

## Usage

`runrun` will open two tabs in the Terminal application, one for the Metro server and the other for running the app on the selected platform.
`runrn ios` will run the app on the iOS platform.
`runrn android` will run the app on the Android platform.

Run with idDevice
`runrn -id abcd1234` will run the app on the android platform on the device with the ID abcd1234.
