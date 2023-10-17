# 🔄 Rotate Tailscale Exit Nodes

Bash script to jump to another Tailscale exit node. 

Steps to run:

- Clone repository
- Edit `rotate.sh` file to set the Tailscale binary to the path where it's on your computer. Use `which tailscale` to find.
- Run `chmod +x rotate.sh`
- Run `./rotate.sh`

If you use a program like Keyboard Maestro, you can also configure an action to run that script with a hotkey.