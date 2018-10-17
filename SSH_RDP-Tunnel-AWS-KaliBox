# Connect to AWS Kali via RDP
    use an SSH tunnel to tunnel the RDP service on a port of your choosing
    ref: https://forums.kali.org/showthread.php?34751-How-to-set-up-xrdp-on-the-AWS-Kali-image
    ref: https://www.hack4charity.org/2017/09/13/securely-accessing-kali-linux-with-gui-on-amazon-ec2-from-window-host/
##### Update
    sudo apt-get update -y && apt-get upgrade  -y
    sudo apt-get dist-upgrade -y
##### Packages 
    sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
    sudo update-alternatives --config x-session-manager    
>   choose xfce4-session 
##### Add New SSH/RDP user(might not be needed if Tunneling via your SSH conn.)
    sudo useradd -m kali
    sudo passwd kali
    sudo usermod -a -G sudo kali
    sudo chsh -s /bin/bash kali
##### Edit Xrdp ini on Kali Box
    sudo nano /etc/xrdp/xrdp.ini
>   Edit the TCP port to listen on. 3390 instead of 3389 if you usually use RDP on your windows box for other conns.
>    max_bpp=16  edit this to reduce color depth and avoid black screens
>    unde [sesman any] options enter the username/password created earlier
##### Add the user to the allowed xrdp connections
    sudo nano /etc/X11/Xwrapper.config
>   Add your created user above     ie; allowed_users=sbracamonte
##### Start services
    sudo service xrdp start
    sudo service xrdp-sesman start
##### Set Services to start on boot and check status
    sudo update-rc.d xrdp enable
    sudo systemctl enable xrdp-sesman.service
    sudo service xrdp status
    sudo service xrdp-sesman status
#### Start Connect to your AWS Kali box via Putty/SSH 
>   Right click the frame of the putty window and choose "Change Settings" > Connection > Tunnels > Add new forwarded port: source port: 44632(can be anything) destination: 3390(the port you are tunneling from the kali box that was setup to listen for rdp connections) > Add > Apply > minimize or leave open 
##### Connect via RDP to through tunneled SSH connection
> open RDP connection > Localhost:44632
> sign in with configured credentials above

    
