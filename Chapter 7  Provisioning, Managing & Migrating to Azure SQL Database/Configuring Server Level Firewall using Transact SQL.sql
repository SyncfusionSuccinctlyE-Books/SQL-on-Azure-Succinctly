--Create New Firewall rule
EXEC sp_set_firewall_rule @name = N'DBAFirewallRule', @start_ip_address = '172.16.1.1', @end_ip_address = '172.16.1.10'
-- Update an existing Firewall rule
EXEC sp_set_firewall_rule @name = N'DBAFirewallRule', @start_ip_address = '172.16.1.4', @end_ip_address = '172.16.1.10'
--Delete an existing Firewall rule
EXEC sp_delete_firewall_rule @name = N'DBAFirewallRule'
