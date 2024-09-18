/ip firewall filter
add action=add-src-to-address-list address-list=bruteforce_blacklist address-list-timeout=1d chain=input comment=Blacklist connection-state=new dst-port=22 protocol=tcp src-address-list=connection3
add action=add-src-to-address-list address-list=connection3 address-list-timeout=1h chain=input comment="Third attempt" connection-state=new dst-port=22 protocol=tcp src-address-list=connection2,!secured
add action=add-src-to-address-list address-list=connection2 address-list-timeout=15m chain=input comment="Second attempt" connection-state=new dst-port=22 protocol=tcp src-address-list=connection1
add action=add-src-to-address-list address-list=connection1 address-list-timeout=5m chain=input comment="First attempt" connection-state=new dst-port=22 protocol=tcp
add action=accept chain=input dst-port=22 protocol=tcp src-address-list=!bruteforce_blacklist