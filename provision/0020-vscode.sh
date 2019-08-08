echo === VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o /tmp/vscode.deb 2>/dev/null
sudo apt-get install -y -f /tmp/vscode.deb libxss1
rm -f /tmp/vscode.deb

sudo apt-get install -y apt-transport-https
sudo apt-get update -y
sudo apt-get install -y code

