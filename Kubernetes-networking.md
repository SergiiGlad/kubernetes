# Proxies 

https://kubernetes.io/docs/concepts/cluster-administration/proxies/#proxies

There are several different proxies you may encounter when using Kubernetes:
* The kubectl proxy
* The apiserver proxy
* The kube proxy
* A Proxy/Load-balancer in front of apiserver(s)
* Cloud Load Balancers on external services

### Service Type

There are 4 types of Services defined in K8S:

* __ClusterIP__: access a Service via an VIP, but this VIP could only be accessed inside this cluster
* __NodePort__: access a Service via NodeIP:NodePort, this means the port will be reserved on all nodes inside the cluster
* __ExternalIP__: same as ClusterIP, but this VIP is accessible from outside of this cluster
* __LoadBalancer__


https://arthurchiao.github.io/blog/cracking-k8s-node-proxy/

## Impelenetation: proxy via userspace socket

__Code__

```

func main() {
	clusterIP := "10.7.111.132"
	podIP := "10.5.41.204"
	port := 80
	proto := "tcp"

	addRedirectRules(clusterIP, port, proto)
	createProxy(podIP, port, proto)
}

func addRedirectRules(clusterIP string, port int, proto string) error {
	p := strconv.Itoa(port)
	cmd := exec.Command("iptables", "-t", "nat", "-A", "OUTPUT", "-p", "tcp",
		"-d", clusterIP, "--dport", p, "-j", "REDIRECT", "--to-port", p)
	return cmd.Run()
}

func createProxy(podIP string, port int, proto string) {
	host := ""
	listener, err := net.Listen(proto, net.JoinHostPort(host, strconv.Itoa(port)))

	for {
		inConn, err := listener.Accept()
		outConn, err := net.Dial(proto, net.JoinHostPort(podIP, strconv.Itoa(port)))

		go func(in, out *net.TCPConn) {
			var wg sync.WaitGroup
			wg.Add(2)
			fmt.Printf("Proxying %v <-> %v <-> %v <-> %v\n",
				in.RemoteAddr(), in.LocalAddr(), out.LocalAddr(), out.RemoteAddr())
			go copyBytes(in, out, &wg)
			go copyBytes(out, in, &wg)
			wg.Wait()
		}(inConn.(*net.TCPConn), outConn.(*net.TCPConn))
	}

	listener.Close()
}

func copyBytes(dst, src *net.TCPConn, wg *sync.WaitGroup) {
	defer wg.Done()
	if _, err := io.Copy(dst, src); err != nil {
		if !strings.HasSuffix(err.Error(), "use of closed network connection") {
			fmt.Printf("io.Copy error: %v", err)
		}
	}
	dst.Close()
	src.Close()
}
```
