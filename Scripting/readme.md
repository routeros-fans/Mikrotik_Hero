# Router-os scripting
in this section we will review how to develop scripts in Router-os.
<ul>
<li>1.<a href="#basic-scripting-commands">Basic Scripting Commands</a></li>
<li>2.<a href="#functions">Funtions</a></li>
<li>3.<a href="#mikrotik-one-liners">Mikrotik One-Liners</a></li>
<li>4.<a href="#usefull-mikrotik-scripts">Usefull Mikrotik Scripts</a></li>
</ul>




## Basic Scripting Commands


|Command|Description|
|---|---|
|:local <variable name> <value>|Defines a local variable with the optional assigned value|
|:global <variable name> <value>|Defines a global variable with the optional assigned value|
|:set <variable name> <value>|Updates / Sets the variable to the assigned value|
|:put <value>|Prints the command result to terminal|
|:log info/warning/error “<value>”|Creates a log entry using the provided value|
|$variablesubstitution|Returns variable data - :put $variable1|
|:if (<condition>) do={ } else={ }|If this then that, else this – standard conditional if statement|
|[ <comand line substitution> ]|Allows interpreted value – [/ip hotspot active print count-only]|
|( <grouping operator> )|Useful for math and concatenation functions – (( $x * $y) + 50)|
| # comment |Add script comment – must be placed at beginning of line|



## Functions

|Command|Description|
|---|---|
|:resolve example.com|Return the IP address resolution for a DNS lookup|
|:pick <str> <start> <end>|Return a specific section of the provided value|
|:len <str>|Return the value length or number of items in an array|
|:find <str> <tofind>|Find the first occurrence of the search term|
|:for <str> from=0 to=10 do={ }|Perform an action for the required number of iterations|
|:foreach <str> in=[/ip arp find] do={$cmd }|Perform an action against each matching instance|
|:do :while OR :while :do|Perform an action against a conditional check|
|:set arraytest {“a”;”b”;”c”;”d”}|Create an array of values instead of a basic string|
|:put ($arraytest->3)|Returning a specific value from an array|
|[/ip arp find address~"^192"]|Searching for matches using a regular expression|
|Defined Functions!|Functions/subroutines that can be called inside scripts|




## Usefull Mikrotik Scripts
|Script|Description|Link|
|---|---|---|
|DNS-checker.rsc|set the dns servers with the lowest ping|<a href="DNS-checker.rsc">Link</a>|
|block-dns-recursive.rsc|Block-Open Recursive DNS|<a href="Block-dns-recursive.rsc">Link</a>|
|block-hotspot.rsc|block users hotspoting thier internet|<a href="block-hotspot.rsc">Link</a>|
|protect-port-service.rsc|Securing the Default Service Port telnet, ssh, ftp, winbox, www and api. or if not in use can be disabled. if using a custom port|<a href="protect-port-service.rsc">Link</a>|
|block-modem-access.rsc|Modem or ISP router generally has a default configuration.block poeples access to the modem or gateway Router.|<a href="block-modem-access.rsc">Link</a>|
|drop-tracert.rsc|Hide network path by blocking icmp traffic|<a href="drop-tracert.rsc">Link</a>|






## Mikrotik One-Liners

return average ping time of a domain name:

    :put ([/tool flood-ping [:resolve "www.mikrotik.com"] count=3 as-value]->"avg-rtt")

return average ping time of a ip:

    :put ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt")



set best dns servers based of average ping time:

    :global ping2 ([/tool flood-ping 8.8.8.8 count=3 as-value]->"avg-rtt");:global ping1 ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt");:if ($ping1>$ping2) do={[/ip dns set servers=1.1.1.1]} else={[/ip dns set servers=8.8.8.8]};


adding the script to the scripts section on mikrotik:

    /system script add name=best_DNS source=[:global ping2 ([/tool flood-ping 8.8.8.8 count=3 as-value]->"avg-rtt");:global ping1 ([/tool flood-ping 1.1.1.1 count=3 as-value]->"avg-rtt");:if ($ping1>$ping2) do={[/ip dns set servers=1.1.1.1]} else={[/ip dns set servers=8.8.8.8]};];

run that script with scheduler:

    system scheduler add name=sch-dns interval=60s on-event=s1


run that script with cli:

    system scripts run s1
