echo === VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o /tmp/vscode.deb 2>/dev/null
sudo apt-get install -y /tmp/vscode.deb libgtk2.0-0 libxss1 libasound2
rm -f /tmp/vscode.deb

