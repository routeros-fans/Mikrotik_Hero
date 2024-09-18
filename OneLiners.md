# Mikrotik One Liners 


## Mikrotik One-Liners

### return average ping time of a domain name:

    :put ([/tool flood-ping [:resolve "www.mikrotik.com"] count=3 as-value]->"avg-rtt")

### return average ping time of a ip:

    :put ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt")



### set best dns servers based of average ping time:

    :global ping2 ([/tool flood-ping 8.8.8.8 count=3 as-value]->"avg-rtt");:global ping1 ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt");:if ($ping1>$ping2) do={[/ip dns set servers=1.1.1.1]} else={[/ip dns set servers=8.8.8.8]};


### adding the script to the scripts section on mikrotik:

    /system script add name=best_DNS source=[:global ping2 ([/tool flood-ping 8.8.8.8 count=3 as-value]->"avg-rtt");:global ping1 ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt");:if ($ping1>$ping2) do={[/ip dns set servers=1.1.1.1]} else={[/ip dns set servers=8.8.8.8]};];

### run that script with scheduler:

    system scheduler add name=sch-dns interval=60s on-event=s1


### run that script with cli:

    system scripts run s1


### Delete logs by terminal:

one line

    /system logging action set memory memory-lines=1

or one hundred lines

    /system logging action set memory memory-lines=100





### redirect a.b.c.d (ip) to 192.168.1.101:5900

    /ip firewall nat add chain=dstnat dst-address=a.b.c.d protocol=tcp dst-port=5900
    action=dst-nat to-addresses=192.168.1.101 to-ports=5900



### redirect a request to another port (port 52 redirects to 22)

    ip firewall nat add chain=dstnat protocol=tcp dst-port=52 action=redirect to port=22




### Drop google.com with just a line

    /ip firewall filter
    add action=drop chain=forward content=google.com

### fetch Iranian IP Address
you can change it to any country you want 

    /tool fetch url=http://www.iwik.org/ipcountry/mikrotik/IR
    /import file-name=IR




### redirect DNS request to a IP

    /ip dns static add regexp=".*\\.com\$" forward-to=192.168.1.186



### check for updates just with one script

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


### save backup and restore backup


save Configuration

    /system backup save filename=[backup_filename.backup]

Load Configuration

    /system backup load filename=[backup_filename.backup]

