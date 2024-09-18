# Hardening MikroTik RouterOS

<ul>
<li>Customized RouterOS Configurations</li>
<li>RouterOS Firewall</li>
</ul>

## Customized RouterOS Configurations

<ul>
<li>Login Services</li>
<li>IP Services</li>
<li>MAC WinBox</li>
<li>RoMON</li>
<li>Login Credentials</li>
<li>Router Interface</li>
<li>LCD touch screen</li>
<li>Neighbor Discovery</li>
<li>BTest Server</li>
<li>NTP Clock Synchronization</li>
<li>Logging</li>
<li>SSH</li>
<li>Configuration Backup</li>
<li>SNMP</li>
<li>Removing unsed packages</li>
<li>Changing Service Port</li>
<li>Updating RouterBoard</li>
<li>Disable Mac Server</li>
<li>Disable Neighbor Discovery</li>
<li>Disable Serial Port</li>
</ul>




### Disable Serial Port

    /system console disable [find where port=serial0]



### Login Services: 
{IP->Services} Disable unused services,Or modify default port, Limit access from specific network


### MAC WinBox: 
{Tools->MAC Server} Disable Allow to login from all interfaces and Allow from specific interface only


    /tool mac-server set [find] disabled=yes
    /tool mac-server mac-winbox set [find] disabled=yes
    /tool mac-server ping set enabled=no


### RoMON: 
{Tools->RoMON} it is Disable by default

    /tool romon set enabled=no


### IP Services
To Monitor Ip services:

    /ip service print


and to disable them:

    /ip service disable [find name=telnet]
    /ip service disable [find name=ftp]
    /ip service disable [find name=www]
    /ip service disable [find name=www-ssl]
    /ip service disable [find name=api]
    /ip service disable [find name=api-ssl]
    /tool bandwidth-server set enabled=no
    /ip dns set allow-remote-requests=no
    /ip socks set enabled=no


### SSH
using stronger encryption algorithm

    /ip ssh set strong-crypto=yes



### Login Credentials: 
{System->Users}
<ul>
<li> Rename default admin account</li>
<li> Strong password policy</li>
<li> Set the right permission (group) to router users</li>
<li> Backup login account</li>

</ul>



### Router Interface
Disable all unused interfaces on your router, in order to decrease unauthorized access to your router.

    /interface print

    /interface set 4,5 disabled=yes


### LCD touch screen
Some RouterBOARDs have LCD module for informational purpose, set pin or disable it.

    /lcd set enabled=no
    /lcd set touch-screen=disabled


### Neighbor Discovery: 
{IP->Neighbors} Disable Discovery on Interface that connect to WAN Interface are Disable for Neighbors Discovery


    /ip neighbor discovery settings set default=no default-for-dynamic=no
    /ip neighbor discovery set [find] discover=no
    /ipv6 nd set [find] disabled=yes


### BTest Server: 
{Tools-> Btest Server} it is used for Bandwidth Test its recommended to Disable when not used it


### NTP Clock Synchronization
Keep the router sync with accurate clock.you should choose the ntp server based on your location.



### Logging:
{System->Logging} Send log message to SysLog Server


### Configuration Backup:

save Configuration

    /system backup save filename=[backup_filename.backup]

Load Configuration

    /system backup load filename=[backup_filename.backup]




### update regularly:
check for updates just with one script

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



### Updating RouterBoard 

    /system routerboard print


    /system routerboard upgrade


### Wireless Client Isolation
Allows multiple clients to be on the same network,but not send traffic to each other.



### Disable Mac Server

    /tool mac-server set \allowed-interface-list=none


    /tool mac-server mac-winbox set \allowed-interface-list=none



### Disable Neighbor Discovery


    /tool mac-server mac-winbox set \allowed-interface-list=none


### SNMP: 
{IP->SNMP}Simple Network Management Protocol,Used to Monitor Bandwidth and resource usages.it is recommend to monitor network devices.


### Disable Console Port

    /system console disable numbers=0

To check it:

    /system console print


### Removing unsed packages
To monitor packages

    /system package print

for example removing MPLS Package

    /system package disable MPLS

### Changing Service Port
to see which services are active
    /ip service print

change to port=1213

    /ip service set ssh port=1213



## Security Recommendations
<ul>
<li> Disable unused ports and services on router</li>
<li> Strong password policy for router users and allow to remote from specific network</li>
<li> Disable discovery interfaces on outside/WAN ports</li>
<li> Clock should be accurate synchronize</li>
<li> Enable SysLog and SNMP for monitoring the router</li>
<li> Separate network for each LAN and Server</li>
<li> Used Address list to group all address for used in Firewall</li>
<li> Used Action=Jump to organized the Firewall rules and better performance</li>
<li> Used Firewall to protect router itself, inside network and the Servers</li>
</ul>

