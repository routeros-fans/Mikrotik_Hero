# Hardening MikroTik RouterOS

<li>
<ul>Customized RouterOS Configurations</ul>
<ul>RouterOS Firewall</ul>
</li>

## Customized RouterOS Configurations

<li>
<ul>Login Services</ul>
<ul>MAC WinBox</ul>
<ul>RoMON</ul>
<ul>Login Credentials</ul>
<ul>Router Interface</ul>
<ul>LCD touch screen</ul>
<ul>Neighbor Discovery</ul>
<ul>BTest Server</ul>
<ul>NTP Clock Synchronization</ul>
<ul>Logging</ul>
<ul>Configuration Backup</ul>
<ul>SNMP</ul>
</li>



### Login Services: 
{IP->Services} Disable unused services,Or modify default port, Limit access from specific network


### MAC WinBox: 
{Tools->MAC Server} Disable Allow to login from all interfaces and Allow from specific interface only


### RoMON: 
{Tools->RoMON} it is Disable by default

    /tool romon set enabled=no


Login Credentials: 
{System->Users}
<ul>
<ul> Rename default admin account</ul>
<ul> Strong password policy</ul>
<ul> Set the right permission (group) to router users</ul>
<ul> Backup login account</ul>
</ul>

### Router Interface
Disable all unused interfaces on your router, in order to decrease unauthorized access to your router.



### LCD touch screen
Some RouterBOARDs have LCD module for informational purpose, set pin or disable it.



### Neighbor Discovery: 
{IP->Neighbors} Disable Discovery on Interface that connect to WAN Interface are Disable for Neighbors Discovery


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




### Wireless Client Isolation
Allows multiple clients to be on the same network,but not send traffic to each other.



### SNMP: 
{IP->SNMP}Simple Network Management Protocol,Used to Monitor Bandwidth and resource usages.it is recommend to monitor network devices.





## Security Recommendations

<ul> Disable unused ports and services on router
<ul> Strong password policy for router users and allow to remote from specific network
<ul> Disable discovery interfaces on outside/WAN ports
<ul> Clock should be accurate synchronize
<ul> Enable SysLog and SNMP for monitoring the router
<ul> Separate network for each LAN and Server
<ul> Used Address list to group all address for used in Firewall
 Used Action=Jump to organized the Firewall rules and better performance
 Used Firewall to protect router itself, inside network and the Servers


