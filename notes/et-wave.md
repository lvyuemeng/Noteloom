Covariant form:

$$
\partial_{\mu} F^{\mu \nu}= - \mu_0 j^\nu \\
\text{lorentz gauge:} \quad \partial_{\mu} A^\mu = 0 \\
\square A^\nu = - \mu_0 j^\nu
$$

No source:
$$
\square A^\nu = 0 \\
\therefore (-\frac{1}{c^2}\frac{\partial^2}{\partial t^2} + \nabla^2) A^\nu = 0
$$

Given 4-vector $k$ for simplicity:
$$
A^\mu = \mathcal{A}_k \epsilon^\mu(k) e^{-ikx}
$$

Insert will results:
$$
k^2 = 0 \\
$$

Lorentz gauge gives:
$$
\partial_\mu A^\mu = \partial_\mu (\epsilon^\mu(k)e^{ikx}) = ik_{\mu} \epsilon^\mu (k) e^{ikx} = 0 \\
\therefore k_{\mu} \epsilon^{\mu}(k) = \eta_{\mu \nu} k^\mu \epsilon^{\nu}(k) = 0
$$

So based on two restrictions, we choose as $(t,\mathbf{x})$:
$$
k^{\mu} = k_0(1,0,0,1) \\
\epsilon^{\mu}_1(k) = (0,1,0,0) \\
... = (0,0,1,0) \\
\epsilon^{\mu}_{weird}(k) = (1,0,0,1) \\
$$

The third is parallel to $k$, but how? Notice that it's not realistic! $\eta_{\mu \nu} \epsilon^\mu(k) \epsilon^{\nu}(k) = 0$ for the weird polarization direction.

Actually, lorentz gauge can be restricted further.

$$
A^\mu \to A'^\mu = A^\mu - \partial^{\mu} \theta \quad \square \theta = 0 \\
\partial_\mu A'^\mu = 0 \\
\text{Then we choose:} \quad \theta = ae^{ikx} \\
A^\mu - iak^{\mu} e^{ikx}
$$
Can always reduce the direction parallel to $k$.

The basis is called linear polarization, which means the amplitude always in the fixed direction.

Another basis for circular polarization:
$$
\hat{e}_1 = \frac{1}{\sqrt{2}}(0,1,i,0) \\
\hat{e}_2 = \frac{1}{\sqrt{2}}(0,1,-i,0) \\
(0,1,i,0) \sim \mathrm{Re}((\hat{x} + i\hat{y})(e^{ikx})) \sim cos (k_\mu x^\mu + \delta_1) \hat{x} + sin (k_\mu x^\mu + \delta_2) \hat{y} 
$$

Which will circle around.

A general solution would be a wave packet summation of every plane waves. 

$$
A^\mu(t,\mathbf{x}) = \int \frac{d^3k}{2\pi^3} \sum_{\lambda=1,2}(\epsilon_{\lambda}(\mathbf{k})A_{\mathbf{k},\lambda}e^{ikx} + \epsilon^*_{\lambda}(\mathbf{k})A^*_{\mathbf{k},\lambda}e^{-ikx})|_{k^0 = +|\mathbf{k}|}
$$

Where the bottom notation saying:
$$
\frac{\omega}{c} = +|\mathbf{k}|
$$

We could even incorporate $d\omega$ and give a $\delta (\frac{\omega}{c} - |\mathbf{k}|)$.

$$
E^i = \partial^0 A^i - \partial^i A^0 \\
\sim -i\omega A^i - ik^i A^0 \\
B^k = \frac{1}{2}(\partial^i A^j - \partial^j A^i) \epsilon_{ijk} = \epsilon_{ijk} \partial^i A^j \sim \epsilon_{ijk} ik^i A^j \\
\mathbf{E} \perp \mathbf{B}
$$

The last proposal is due to the reason that $E^i$ is proportional to $A^i$ while $B^i$ is perpendicular (or cross product) of $A^i$. While the time component is perpendicular to space component, it doesn't effect the relation.(Or you can see the basis $\epsilon^\mu$, there's no time component $A^0$.)

Then we exploit that $k^i \sim \omega/c$, so:
$$
c \mathbf{B} = \hat{k} \times \mathbf{E} \\
u(t,\mathbf{x}) = \frac{1}{2}(\epsilon_0 \mathbf{E}^2 + \frac{1}{\mu_0}\mathbf{B}^2) = \epsilon_0 \mathbf{E}^2
$$

The momentum density must be proportional to:
$$
g(t,\mathbf{x}) \sim \mathbf{E} \times \mathbf{B}
$$

We know $[E] \sim \epsilon_0\mathbf{E}^2 \sim \epsilon_0 c \mathbf{E} \mathbf{B}$, then $[P] \sim [E]/[V] \sim \epsilon_0 \mathbf{E} \mathbf{B}$.

$$
g(t,\mathbf{x}) = \epsilon_0/c \mathbf{E} \times \mathbf{B} 
$$

Poynting vector must be $[E][V] \sim c \epsilon_0 \mathbf{E}^2$. Then $\mathbf{S} = c^2 g(t,\mathbf{x})$.

The time average is simple, we use $\hat{e}$ as basis for simplicity:
$$
\braket{\mathbf{E}^2} = \frac{1}{4}(\hat{e} E e^{ikx} + \hat{e}^* E^* e^{-ikx})^2 \\
$$

Notice that, $e^{2i\omega t}$ in time period integral is zero. So $LHS = \frac{1}{2} E^2$.

