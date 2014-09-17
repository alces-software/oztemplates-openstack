oz-install -d3 -u centos-minimal.tdl -x centos-minimal.xml -p -a centos-minimal.auto -c ../../config/oz.cfg
virt-sysprep -a /var/lib/libvirt/images/centos6.5-minimal.qcow2
