# ActiveDirectory-Project
This repository documents the process of configuring and managing an Active Directory environment, integrating tools such as PowerShell, Splunk, Sysmon, and ServiceNow to demonstrate advanced system administration and security monitoring capabilities.

---

## Tools Used:
- **Active Directory**: For centralized domain management and user authentication.
- **PowerShell**: For scripting and automation of tasks within the AD environment.
- **Windows 10**: As the client system integrated into the domain.
- **Splunk**: For security information and event management (SIEM), used to collect and analyze system logs.
- **Sysmon**: For detailed event logging to support security analysis in Splunk.
- **ServiceNow**: For IT service management and automated incident ticketing.
- **Kali Linux**: For simulating cyberattacks and generating alerts.
- **Virtual Network Environment**: Created using virtual machines to replicate an enterprise setup.

---

## Step-by-Step Guide:

### Phase 1: Environment Setup and Configuration

#### Setting Up the Virtual Environment:
1. Configure a virtualized network with the following components:
   - **Active Directory Domain Controller** on a Windows Server VM.
   - **Windows 10 Client Machine** integrated into the AD domain.
   - **Kali Linux VM** for simulating cyberattacks and generating event data.
2. Establish connectivity between all virtual machines within the same virtual network.

#### Installing and Configuring Active Directory:
1. Set up Active Directory Domain Services (AD DS) on the domain controller.
2. Create user accounts, groups, and organizational units to simulate departmental structures.
3. Integrate the Windows 10 client machine into the AD domain.

#### Configuring Splunk and Sysmon:
1. Install Splunk on a dedicated virtual machine or server.
2. Deploy and configure Sysmon on both the domain controller and the client machine to collect detailed system events.
3. Integrate Sysmon logs into Splunk as a data source for security monitoring.

### Phase 2: Security Monitoring and Alert Configuration

#### Configuring Splunk Alerts:
1. Set up alerts to monitor suspicious events such as:
   - Multiple failed login attempts.
   - Unauthorized file modifications.
   - Network connections to unusual destinations.
2. Test alerts by simulating activities, such as failed logins and brute-force attempts, using PowerShell or Kali Linux tools.

#### Incident Detection:
1. Analyze event data collected in Splunk to identify anomalies or potential threats.
2. Simulate cyberattacks (e.g., port scans or password attacks) to generate actionable alerts.

### Phase 3: Incident Response and Automation

#### Responding to Security Incidents:
1. Investigate triggered Splunk alerts to identify the root cause of incidents.
2. Develop and execute an incident response plan to contain, eradicate, and recover from threats.

#### ServiceNow Integration:
1. Automate the creation of incident tickets in ServiceNow based on Splunk alerts.
2. Document the incident response process and track resolutions within ServiceNow.

