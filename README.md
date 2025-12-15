# Windows Tweaks

A collection of PowerShell scripts designed to optimize Windows performance, reduce latency, and improve privacy by disabling online search integrations.

## Scripts

### Disable-Online-Start-Menu-Search.ps1
**Purpose:** Prevents the Start Menu from sending keystrokes to Bing and displaying online search suggestions/ads.
- **Action:** Sets `DisableSearchBoxSuggestions` to `1`.
- **Target:** `HKCU:\Software\Policies\Microsoft\Windows\Explorer`
- **Downsides:** Removes web results, weather, and calculations from the Start Menu.

### Disable-Startup-Delay.ps1
**Purpose:** Speeds up the login process by removing the artificial delay Windows places on startup applications.
- **Action:**
  - Sets `StartupDelayInMSec` to `0`.
  - Sets `WaitForIdleState` to `0`.
- **Target:** `HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize`
- **Downsides:** May cause temporary system lag at login. Some apps might fail to launch correctly.

### Reduce-Latency.ps1
**Purpose:** Applies network and system profile optimizations to lower latency (ping) and improve responsiveness, primarily for gaming.
- **Features:** Auto-elevates to Administrator.
- **Network Actions:**
  - Disables Nagle's Algorithm (`TCPNoDelay`) on active adapters.
  - Disables Delayed ACK (`TcpAckFrequency`) on active adapters.
- **System Actions:**
  - Disables Network Throttling (`NetworkThrottlingIndex`).
  - Sets System Responsiveness to Gaming Priority (`SystemResponsiveness`).
- **Downsides:** May slightly reduce maximum download speeds. Can increase battery consumption on laptops.

## How to Run

1. Open **PowerShell**.
2. Navigate to the folder containing these scripts:
   ```powershell
   cd "path\to\Windows-Tweaks"
   ```
3. Run a script by typing `.\` followed by the filename:
   ```powershell
   .\Disable-Startup-Delay.ps1
   ```

### Troubleshooting
If you see an error stating that "running scripts is disabled on this system", you can run the script with the Execution Policy bypass flag:

```powershell
powershell -ExecutionPolicy Bypass -File .\Disable-Startup-Delay.ps1
```
