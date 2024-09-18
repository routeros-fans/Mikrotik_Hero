# How to ...?
in this section i am collecting interesting FAQ.just simply search for what you are looking for.


## How to look for updates?

    system package update check-for-updates

and if you want to update

    system package update upgrade


## How to Mikrotik Factory Reset Guide
<ul>
<li>Disconnect the power cord from the unit.</li> 
<li>Hold the reset button and do not release.</li> 
<li>Plug the power cord in and wait until the ACT light starts flashing.</li> 
<li>Now release the button to clear configuration.</li> 
<li>Wait for a few minutes for the router to clear and restore the factory settings</li> 
</ul>

## How to monitor CPU usage in Mikrotik?
just type this command in the terminal or goto tool profile.
    /tool profile


## How to reset password in mikrotik?
we have official way to restore password in mikrotik.if you try to reset mikrotik all configurations will be deleted.


## How to Traceroute an ip address?
enter following command and then type ip address

    /tool traceroute


## How to resolve a domain name in mikrotik shell:

    put [resolve google.com server 8.8.8.8]


## How to set ntp client using command line?
after this command you need to reboot the system.

    /system ntp client
    set enabled=yes server-dns-names=time.google.com,0.pool.ntp.org


## how to get out of safe mode?
just <code>[ctrl+x]</code> in command line.

## how to recover forgotten passwords in RouterOS?
There is no password recovery procedure in mikrotik devices.you will need to re-flash the board using NetInstall.

## how to shutdown mikrotik router board?
log onto the router and click on "System > Shutdown" or
    /system shutdown


## how to turn ON mikrotik router board?
disconnect it from power, completely, then reconnect a power source to it


## how to downgrade RouterOS version?
Drag and drop lower version then got to <code>System</code>--> <code>Package List</code>



## how to upgradee RouterOS version?
<p>1. Drag and drop Upper version then reboot </p>
<p>2. <code>System</code>--> <code>Package List</code> --><code>check for updates</code> </p>

## how to reset a RouterOS device

<p>1.run the command <code>/system reset-configuration</code>from command line interface </p>
<p>2.do it from <code>System</code> --> <code>Reset Configuration </code>menu in the graphical user interface</p>


## how to do load balancing and Link Redundancy in mikrotik?

<ul>
<li>Configuring Mikrotik</li>
<li>Configuring Mangle</li>
<li>Configuring Policy-based routing</li>
<li>Configuring NAT</li>
</ul>

## How to add an interface to dhcp client interfaces?

/ip dhcp-client add interface=ether1 disabled=no
<p>and to see if its working:

    ip dhcp-client> print detail

</p>

## how to block windows update ?

    /ip firewall filter
    add action=drop chain=forward comment="Windows Update" content=windowsupdate.microsoft.com
    add action=drop chain=forward comment="Windows Update" content=*.windowsupdate.microsoft.com
    add action=drop chain=forward comment="Windows Update" content=*.update.microsoft.com
    add action=drop chain=forward comment="Windows Update" content=*.windowsupdate.com
    add action=drop chain=forward comment="Windows Update" content=download.windowsupdate.com
    add action=drop chain=forward comment="Windows Update" content=download.microsoft.com
    add action=drop chain=forward comment="Windows Update" content=*.download.windowsupdate.com
    add action=drop chain=forward comment="Windows Update" content=wustat.windows.com
    add action=drop chain=forward comment="Windows Update" content=ntservicepack.microsoft.com
    add action=drop chain=forward comment="Windows Update" content=stats.microsoft.com


<p>Note:if a user establish a vpn connection this rule is useless!!!</p>
<p>Note:you can also add more subdomains</p>


## How to update mikrotik?

check for updates just with one script and install it

after 6.31 version:

    /system package update
    Check-for-updates once
    : delay 1s;
    : If ([get status] = "New version is available") do= {install}


before 6.31 version:

    System package update
    Check-for-updates
    : delay 1s;
    : if ( [get current-version] != [get latest-version]) do={ upgrade }

## How to backup RouterOS Configuration Files?


save Configuration

    /system backup save filename=[backup_filename.backup]

Load Configuration

    /system backup load filename=[backup_filename.backup]



## How to Backup Mikrotik Settings?

<ul>
<li>Web Interface: Login > Files > Backup (optional: name & password).</li> 
<li>Winbox: Connect > Files > New > Backup (optional: name & password).</li> 
<li>Terminal: Upload backup file (if needed).</li> 
<li>Terminal: cd /files (navigate to backup location).</li> 
<li>Terminal: /system backup load filename=[backup_filename.backup].</li> 
<li>(Terminal & Winbox): Confirm & enter password (if needed).</li> 
<li>(Terminal & Winbox): Monitor restoration progress.</li> 
<li>(Terminal & Winbox): Download backup for safekeeping.</li> 
<li>(Terminal & Winbox): Reboot (unless using dont-reboot option in terminal).</li> 
<li>Store backup securely (separate from router).</li> 
</ul>





## How to Restore the Backup Mikrotik Terminal?

<ul>
<li>Access the MikroTik terminal.</li> 
<li>Upload backup file (if needed).</li> 
<li>Use /system backup load filename=[backup_filename.backup].</li> 
<li>Confirm and enter the password (if needed).</li> 
<li>Monitor the restoration process.</li> 
<li>Reboot (unless using dont-reboot option).</li> 
</ul>



## How to see RouterOs Configuartion in plain text?

backup the config file without encryption.

    /system backup save name=MikroTikBackup dont-encrypt=yes Saving system configuration

view config file in terminal

    /export file= desired backup name.cfg




## How to Reset Mikrotik Configuration Command?

There are two main ways to reset the MikroTik configuration, using the command line:
<ul>
<li>Software Reset (Preferred): <code>/system reset-configuration </code></li> 
<li>Hardware Reset Button: Less precise, consult your device’s manual for specific instructions<li> 
</ul>

