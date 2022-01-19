
sudo apt remove cmdtest -y || true
sudo apt remove yarn -y || true 
# Add apt-key from yarnpkg
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# Add repository from yarnpkg
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# Update => Reload /etc/apt/{sources.list,sources.list.d}
sudo apt-get update -y
# Install yarn
sudo apt-get install yarn -y