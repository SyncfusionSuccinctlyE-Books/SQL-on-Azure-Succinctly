--Create New Database Level Firewall rule
EXEC sp_set_database_firewall_rule @name = N'ApplicationFirewallRule', @start_ip_address = '172.16.1.11', @end_ip_address = '172.16.1.11'
-- Update an existing Database Level Firewall rule
EXEC sp_set_database_firewall_rule @name = N'ApplicationFirewallRule', @start_ip_address = '172.16.1.11', @end_ip_address = '172.16.1.12'
--Delete an existing Firewall rule
EXEC sp_delete_database_firewall_rule @name = N'ApplicationFirewallRule'
