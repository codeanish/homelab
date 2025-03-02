#!/bin/bash

# Apply config to Control Plane nodes
talosctl patch mc --nodes 10.0.20.151 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.152 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.153 --patch @patch.yml

# Apply config to Worker nodes
talosctl patch mc --nodes 10.0.20.161 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.162 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.163 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.164 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.165 --patch @patch.yml
talosctl patch mc --nodes 10.0.20.166 --patch @patch.yml

