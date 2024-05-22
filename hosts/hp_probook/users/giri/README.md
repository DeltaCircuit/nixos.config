# HP Probook 440 G8

## System Specs

<table>
  <tr>
    <th>Processor</th>
    <td>11th Gen Intel® Core™ i7-1165G7 @ 2.80GHz × 8</td>
  </tr>
  <tr>
    <th>Memory</th>
    <td>16GB</td>
  </tr>
  <tr>
    <th>Disk #0</th>
    <td>512GB</td>
  </tr>
  <tr>
    <th>Graphics</th>
    <td>Mesa Intel® Xe Graphics (TGL GT2)</td>
  </tr>
  <tr>
    <th>Operating System</th>
    <td>Ubuntu 22.04.3 LTS </td>
  </tr>
</table>

## Getting Started  

### Using Nix Cache

The main config uses Nix Community Cache and others. Since current base OS is ubuntu, we need to add those substituters to `/etc/nix/nix.conf` before running. 

```bash
# /etc/nix/nix.conf
trusted-substituters = https://cache.nixos.org https://nix-community.cachix.org
```