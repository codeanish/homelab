1. Create the cluster VMs using Terraform
2. Add the DHCP reservations to DHCP server (manual step currently with unifi)
3. Generate Machine Configurations with QEMU guest configurations `talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir _out --install-image factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.9.3`
4. Create Control plane nodes `talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml`
5. Create Worker nodes `talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml`
6. Configure talos to talk to your control plane:
```
export TALOSCONFIG="_out/talosconfig"
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP
```
7. Retrieve kubeconfig `talosctl kubeconfig .`
8. Play with Kubernetes