# ryzen.rip
structure for installer files

1. install required dependencies
ex: sudo apt update
sudo apt install ... -y

2. download the file
ex: wget --progress=bar:force -O /tmp/<filename>.deb <link>

3. install
ex: sudo dpkg -i /tmp/<filename>.deb

##nginx
to make nginx show directory in browser, add the following in the location block:
`        autoindex on;`

##sync script
the sync script `sync` is the same script ran on my server to keep content on the server up to date with the github
(yes this is a lazy way of doing it, could use webhooks)

when modifying the sync script and want to test, ensure to remove the `/tmp/repo` folder so it will trigger again
