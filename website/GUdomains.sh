

echo "Cleaning up existing build..."
rm -rf Bird-Call-Classifier

# build website
echo "Building the website..."
quarto render

# Set Correct File Permissions
echo "Setting correct file permissions..."

find Bird-Call-Classifier -type f -exec chmod 644 {} \;

find Bird-Call-Classifier -type d -exec chmod 755 {} \;

# push to the Website
read -p "Do you want to push the website to your GU domains folder? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Pushing the website to the remote server..."
    scp -r Bird-Call-Classifier corcoran@corcoran.georgetown.domains:/home/corcoran/public_html/
    echo "Website successfully pushed!"
else
    echo "Skipping deployment."
fi